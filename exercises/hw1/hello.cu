#include <stdio.h>

__global__ void hello(){

  printf("Hello from block: %u, thread: %u\n", blockidx.x, threadidx.x);
}

int main(){

  hello<<<2, 2>>>();
  cudaDeviceSynchronize();
}

