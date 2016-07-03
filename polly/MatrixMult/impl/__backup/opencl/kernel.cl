/* kernel.cl 
 * Matrix multiplication: C = A * B.
 * Device code.
 */
__kernel void matrixMul(__global int* C, 
                        __global int* A, 
                        __global int* B, 
                        int size)
{
  
   int i = get_global_id(0); 
   int j = get_global_id(1);
 
   // value stores the element that is 
   // computed by the thread
   int tmp = 0;
   for (int k = 0; k < size; k++)
   {
      int elm_A = A[i*size+k];
      int elm_B = B[k*size+j];
      tmp += elm_A * elm_B;
   }
 
   // Write the matrix to device memory each 
   // thread writes one element
   C[i*size+j] = tmp;
}