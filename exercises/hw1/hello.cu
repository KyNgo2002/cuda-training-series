#include <stdio.h>
#include <cuda_runtime.h>

__global__ void hello(){

  printf("Hello from block: %u, thread: %u\n", blockIdx.x, threadIdx.x);
}

int main(){

  hello<<<2, 2>>>();
  // Kernel launches are asynchronous to the host thread, meaning the host thread will not wait for completion of kernel before 
  // proceeding to the next line of code.
  // Calling "cudaDeviceSynchronize" synchronizes the host thread to kernels.
  cudaDeviceSynchronize();
  return 0;
}l