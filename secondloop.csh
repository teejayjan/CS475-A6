#!/bin/csh

foreach l (8 16 32 64 128 256 512)
    foreach n (1024 2048 4096 8192 16384 32768 64512 128000 256000 512000 1000448 2000896 4000768 6000640 8000512 10000384)
        g++ -o second second.cpp -DNUM_ELEMENTS=$n -DLOCAL_SIZE=$l /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
        ./second
    end
end