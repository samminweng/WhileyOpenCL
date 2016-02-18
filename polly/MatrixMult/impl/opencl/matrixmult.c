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


int main(int argc, char** argv)
{
   int err;                            // error code returned from api calls

   cl_device_id device_id;             // compute device id 
   cl_context context;                 // compute context
   cl_command_queue commands;          // compute command queue
   cl_program program;                 // compute program
   cl_kernel kernel;                   // compute kernel


   int i, j, jj, k, kk;
   double t_start, t_end;

   // Initialize matrix A, B and C.
   int* A = (int*)malloc(N*N*sizeof(long long));
   int A_size=N*N;
   int* B = (int*)malloc(N*N*sizeof(long long));
   int B_size=N*N;
   int* C = (int*)malloc(N*N*sizeof(long long));
   int C_size=N*N;

   init_array(A, 1);
   init_array(B, 1);
   init_array(C, 1);

   printf("Initializing OpenCL device...\n"); 

   cl_uint dev_cnt = 0;
   clGetPlatformIDs(0, 0, &dev_cnt);

   cl_platform_id platform_ids[100];
   clGetPlatformIDs(dev_cnt, platform_ids, NULL);

   // Connect to a compute device
   int gpu = 1;
   err = clGetDeviceIDs(platform_ids[0], gpu ? CL_DEVICE_TYPE_GPU : CL_DEVICE_TYPE_CPU, 1, &device_id, NULL);
   if (err != CL_SUCCESS){
      printf("Error: Failed to create a device group!\n");
      return EXIT_FAILURE;
    }else{
      printf("SUCCESS: Create a device group!\n");
    }

    // Create a compute context 
    context = clCreateContext(0, 1, &device_id, NULL, NULL, &err);
    if (!context){
      printf("Error: Failed to create a compute context!\n");
      return EXIT_FAILURE;
    }else{
      printf("SUCCESS: Create a compute context\n");
    }


    // Create a command commands
   commands = clCreateCommandQueue(context, device_id, 0, &err);
   if (!commands)
   {
       printf("Error: Failed to create a command commands!\n");
       return EXIT_FAILURE;
   }else{
       printf("SUCCESS: Create commands");
   }
   // Load source kernel file
   /* Load the source code containing the kernel*/
    FILE *fp = fopen("kernel.cl", "r");
    if (!fp) {
      fprintf(stderr, "Failed to load kernel.\n");
      return EXIT_FAILURE;
    }

    fseek(fp, 0, SEEK_END);
    long long source_size = ftell(fp);
    rewind(fp);
    char *source_str = (char*)malloc(source_size*sizeof(char));
    fread(source_str, sizeof(char), source_size, fp);
    fclose(fp);
    printf("%s\n", source_str);

    program = clCreateProgramWithSource(context, 1, (const char **) & source_str, NULL, &err);
    if (!program){
     printf("Error: Failed to create compute program!\n");
     return EXIT_FAILURE;
    }else{
      printf("SUCCESS: Create compute program!\n");
    }

    // Build the program executable
    err = clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
    if (err != CL_SUCCESS){
      printf("Error: Failed to build program executable!\n");
      return EXIT_FAILURE;
    }else{
      printf("Build the program executables\n");
    }

    // Create the compute kernel in the program we wish to run
    //
    kernel = clCreateKernel(program, "matrixMul", &err);
    if (!kernel || err != CL_SUCCESS){
        printf("Error: Failed to create compute kernel!\n");
        return EXIT_FAILURE;
    }else{
      printf("SUCCESS: Create compute kernel\n");
    }

     // Query binary (PTX file) size
    size_t bin_sz;
    err = clGetProgramInfo(program, CL_PROGRAM_BINARY_SIZES, sizeof(size_t), &bin_sz, NULL);
 
    // Read binary (PTX file) to memory buffer
    unsigned char *bin = (unsigned char *)malloc(bin_sz);
    err = clGetProgramInfo(program, CL_PROGRAM_BINARIES, sizeof(unsigned char *), &bin, NULL);
 
    // Save PTX to add_vectors_ocl.ptx
    fp = fopen("add_vectors_ocl.ptx", "wb");
    fwrite(bin, sizeof(char), bin_sz, fp);
    fclose(fp);
    free(bin);

   // Create the input and output arrays in device memory for our calculation
   cl_mem cl_A = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR, A_size*sizeof(int), A, &err);
   cl_mem cl_B = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR, B_size*sizeof(int), B, &err);
   cl_mem cl_C = clCreateBuffer(context, CL_MEM_READ_WRITE, C_size*sizeof(int), NULL, &err);

   if (!cl_A || !cl_B || !cl_C)
   {
       printf("Error: Failed to allocate device memory!\n");
       return EXIT_FAILURE;
   }else{
      printf("SUCCESS: Allocate device memory\n");
   }

   //Launch OpenCL kernel
   
  int size = N;
   err = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void *)&cl_C);
   err |= clSetKernelArg(kernel, 1, sizeof(cl_mem), (void *)&cl_A);
   err |= clSetKernelArg(kernel, 2, sizeof(cl_mem), (void *)&cl_B);
   err |= clSetKernelArg(kernel, 3, sizeof(int), (void *)&size);

   if (err != CL_SUCCESS)
   {
       printf("Error: Failed to set kernel arguments! %d\n", err);
       return EXIT_FAILURE;
   }else{
       printf("SUCCESS: Set kernel arguments\n");
   }
  
  size_t localWorkSize[2], globalWorkSize[2];
   localWorkSize[0] = 16;
   localWorkSize[1] = 16;
   globalWorkSize[0] = 1024;
   globalWorkSize[1] = 1024;
 
   err = clEnqueueNDRangeKernel(commands, kernel, 2, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);

   if (err != CL_SUCCESS)
   {
       printf("Error: Failed to execute kernel! %d\n", err);
       return EXIT_FAILURE;
   }else{
       printf("SUCCESS: Execute kernels!\n");
   }
 
   //Retrieve result from device
   err = clEnqueueReadBuffer(commands, cl_C, CL_TRUE, 0, C_size*sizeof(int), C, 0, NULL, NULL);

   if (err != CL_SUCCESS)
   {
       printf("Error: Failed to read output array! %d\n", err);
       return EXIT_FAILURE;
   }
 
    printf("Pass %d X %d matrix test case (C[N][N] =%d) \n ", N, N, C[(N-1)*N+(N-1)]);

   //Shutdown and cleanup
   free(A);
   free(B);
   free(C);

   clReleaseMemObject(cl_A);
   clReleaseMemObject(cl_B);
   clReleaseMemObject(cl_C);

   clReleaseProgram(program);
   clReleaseKernel(kernel);
   clReleaseCommandQueue(commands);
   clReleaseContext(context);

   return EXIT_SUCCESS;
 }