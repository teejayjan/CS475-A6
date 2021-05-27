#!/bin/bash
#SBATCH -J OpenCLArrayMult
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o second.out
#SBATCH -e second.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=jant@oregonstate.edu

for l in 8 16 32 64 128 256 512
do
    for n in 1024 2048 4096 8192 16384 32768 64512 128000 256000 512000 1000448 2000896 4000768 6000640 8000512 10000384
    do
      g++ -o second second.cpp -DNUM_ELEMENTS=$n -DLOCAL_SIZE=$l /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
      ./second
    done
done  