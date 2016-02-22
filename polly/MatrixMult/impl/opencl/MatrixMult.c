#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <CL/cl.h>
#include <stdbool.h>
#define N 1024


void init_array(int* array, int value)
{
  int i, j;
  for(i=0;i<N;i++){
    for(j=0;j<N;j++){
      array[i*N+j] = value;
    }
  }
}
size_t getFileSize(FILE *fp){
  fseek(fp, 0, SEEK_END);
  size_t source_size = ftell(fp);
  rewind(fp);
  return source_size;
}
// Read the contents of a file and output a string
char* readFileToString(FILE *fp){
  size_t source_size = getFileSize(fp);
  char *source_str = (char*)malloc(source_size*sizeof(char));
  fread(source_str, sizeof(char), source_size, fp);
  fclose(fp);
  printf("%s\n", source_str);
  return source_str;
}
// Write bitcode to 'kernel.bc' file
void writeBitCode(cl_program program){
  cl_int err;
  // Get kernel name
  char kernel_name[100];
  clGetProgramInfo(program, CL_PROGRAM_KERNEL_NAMES, sizeof(kernel_name), &kernel_name, NULL);
  printf("%s", kernel_name);
  // Get binary file size
  size_t bin_sz;
  clGetProgramInfo(program, CL_PROGRAM_BINARY_SIZES, sizeof(size_t), &bin_sz, NULL);
  // Read binary to memory buffer
  unsigned char *bin = (unsigned char *)malloc(bin_sz);
  err = clGetProgramInfo(program, CL_PROGRAM_BINARIES, sizeof(unsigned char *), &bin, NULL);
  // Save compiled code to 'kernel.bc'
  FILE *fp = fopen("kernel.bc", "wb");
  fwrite(bin, sizeof(char), bin_sz, fp);
  fclose(fp);
  free(bin);
}



int* matrix_mult(int* A, size_t A_size, int* B, size_t B_size){
  int err;                            // error code returned from api calls

  cl_device_id device_id;             // compute device id
  cl_context context;                 // compute context
  cl_command_queue commands;          // compute command queue
  cl_program program;                 // compute program
  cl_kernel kernel;                   // compute kernel

  int* C = (int*)malloc(N*N*sizeof(int));
  size_t C_size=N*N;

  printf("Initializing OpenCL device...\n");

  // Get the number of platforms and platform
  cl_uint num_platforms;
  cl_platform_id platforms[32];
  clGetPlatformIDs (32, platforms, &num_platforms);
  printf("Number of platforms:%d\n", num_platforms);
  // Get the device IDs
  //err = clGetDeviceIDs(platforms[0], CL_DEVICE_TYPE_GPU, 1, &device_id, NULL);
  err = clGetDeviceIDs(platforms[0], CL_DEVICE_TYPE_CPU, 1, &device_id, NULL);
  if (err != CL_SUCCESS){
    printf("Error: Failed to create a device group!\n");
    exit(EXIT_FAILURE);
  }else{
    char* device_name[100];
    char* vendor[100];
    cl_uint cl_cu =1;
    cl_ulong cl_size=1;
    clGetDeviceInfo(device_id, CL_DEVICE_NAME, sizeof(device_name), device_name, NULL);
    clGetDeviceInfo(device_id, CL_DEVICE_VENDOR, sizeof(vendor), vendor, NULL);
    clGetDeviceInfo(device_id, CL_DEVICE_MAX_COMPUTE_UNITS, sizeof(cl_cu), &cl_cu, NULL);
    clGetDeviceInfo(device_id, CL_DEVICE_GLOBAL_MEM_SIZE, sizeof(cl_size), &cl_size, NULL);
    printf("SUCCESS: Create a device %s %s of %d computing unit and %.2f mb!\n", vendor, device_name, cl_cu, (double)cl_size/1048576);
  }

  // Create a compute context
  context = clCreateContext(0, 1, &device_id, NULL, NULL, &err);
  if (!context){
    printf("Error: Failed to create a compute context!\n");
    exit(EXIT_FAILURE);
  }else{
    printf("SUCCESS: Create a compute context\n");
  }

  // Create a command queue. Note clCreateCommandQueue is depreciated and replaced with 'clCreateCommandQueueWithProperties'
  commands = clCreateCommandQueueWithProperties(context, device_id, 0, &err);
  if (!commands){
    printf("Error: Failed to create a command commands!\n");
    exit(EXIT_FAILURE);
  }else{
    printf("SUCCESS: Create commands");
  }

  // Load the source code containing the kernel
  FILE *fp = fopen("kernel.cl", "r");
  if (!fp) {
    fprintf(stderr, "Failed to load kernel.\n");
    exit(EXIT_FAILURE);
  }
  // Read the source kernel code
  char* source_str = readFileToString(fp);
  program = clCreateProgramWithSource(context, 1, (const char **) & source_str, NULL, &err);
  if (err != CL_SUCCESS){
    printf("Error: Failed to create compute program!%d\n", err);
    exit(EXIT_FAILURE);
  }else{
    printf("SUCCESS: Create compute program!\n");
  }
  /*
  FILE *fp = fopen("kernel.bc", "r");
  if (!fp) {
    fprintf(stderr, "Failed to load kernel.\n");
    exit(EXIT_FAILURE);
  }
  size_t source_size = getFileSize(fp);
  char* source_str = readFileToString(fp);
  cl_int binary_status;
  program = clCreateProgramWithBinary(context, 1, &device_id, (const size_t *)&source_size,
      (const unsigned char **)&source_str, &binary_status, &err);
  if (err != CL_SUCCESS){
    printf("Error: Failed to create compute program!%d\n", err);
    exit(EXIT_FAILURE);
  }else{
    printf("SUCCESS: Create compute program!\n");
  }
  */
  // C kernel source code is read in and compiled to the executable
  err = clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
  if (err != CL_SUCCESS){
    printf("Error: Failed to build program executable!\n");
    // Determine the size of the log
    size_t log_size;
    clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, 0, NULL, &log_size);

    // Allocate memory for the log
    char *log = (char *) malloc(log_size);

    // Get the log
    clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, log_size, log, NULL);

    // Print the log
    printf("%s\n", log);

    exit(EXIT_FAILURE);
  }else{
    printf("Build the program executables\n");
  }
  writeBitCode(program);

  // Create the compute kernel
  kernel = clCreateKernel(program, "matrixMul", &err);
  if (!kernel || err != CL_SUCCESS){
    printf("Error: Failed to create compute kernel!\n");
    exit(EXIT_FAILURE);
  }else{
    printf("SUCCESS: Create compute kernel\n");
  }



  // Create the input and output arrays in device memory for our calculation
  cl_mem cl_A = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR, A_size*sizeof(int), A, &err);
  cl_mem cl_B = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR, B_size*sizeof(int), B, &err);
  cl_mem cl_C = clCreateBuffer(context, CL_MEM_READ_WRITE, C_size*sizeof(int), NULL, &err);

  if (!cl_A || !cl_B || !cl_C){
    printf("Error: Failed to allocate device memory!\n");
    exit(EXIT_FAILURE);
  }else{
    printf("SUCCESS: Allocate device memory\n");
  }

  //Launch OpenCL kernel

  int size = N;
  err = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void *)&cl_C);
  err |= clSetKernelArg(kernel, 1, sizeof(cl_mem), (void *)&cl_A);
  err |= clSetKernelArg(kernel, 2, sizeof(cl_mem), (void *)&cl_B);
  err |= clSetKernelArg(kernel, 3, sizeof(int), (void *)&size);

  if (err != CL_SUCCESS){
    printf("Error: Failed to set kernel arguments! %d\n", err);
    exit(EXIT_FAILURE);
  }else{
    printf("SUCCESS: Set kernel arguments\n");
  }

  size_t localWorkSize[2], globalWorkSize[2];
  localWorkSize[0] = 16;
  localWorkSize[1] = 16;
  globalWorkSize[0] = N;
  globalWorkSize[1] = N;

  err = clEnqueueNDRangeKernel(commands, kernel, 2, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);

  if (err != CL_SUCCESS){
    printf("Error: Failed to execute kernel! %d\n", err);
    exit(EXIT_FAILURE);
  }else{
    printf("SUCCESS: Execute kernels!\n");
  }

  //Retrieve result from device
  err = clEnqueueReadBuffer(commands, cl_C, CL_TRUE, 0, C_size*sizeof(int), C, 0, NULL, NULL);

  if (err != CL_SUCCESS){
    printf("Error: Failed to read output array! %d\n", err);
    exit(EXIT_FAILURE);
  }

  clReleaseMemObject(cl_A);
  clReleaseMemObject(cl_B);
  clReleaseMemObject(cl_C);

  clReleaseProgram(program);
  clReleaseKernel(kernel);
  clReleaseCommandQueue(commands);
  clReleaseContext(context);

  return C;


}


int main(int argc, char** argv)
{
  int i, j, jj, k, kk;
  double t_start, t_end;

  // Initialize matrix A, B and C.
  int* A = (int*)malloc(N*N*sizeof(int));
  size_t A_size=N*N;
  int* B = (int*)malloc(N*N*sizeof(int));
  size_t B_size=N*N;


  init_array(A, 1);
  init_array(B, 1);
  int* C = matrix_mult(A, A_size, B, B_size);


  printf("Pass %d X %d matrix test case (C[%d] =%d) \n ", N, N, (N-1)*N+N-1, C[(N-1)*N+(N-1)]);

  //Shutdown and cleanup
  free(A);
  free(B);
  free(C);

  return EXIT_SUCCESS;
}
