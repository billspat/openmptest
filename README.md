# openmp test

This is a small and simple test of using OpenMP on systems with GNU compiler.  It's a console-only C program that estimates values of pi.    The gcc compiler and openmp libraries are required.  It was developed on Centos 6.

C code by John Burkardt was taken from https://people.sc.fsu.edu/~jburkardt/c_src/prime_openmp/prime_openmp.html
who has a fantastic collection of example parallel codes in several languages.

For those new to OpenMP, you may compile as follows: 

    gcc -o prime_openmp -fopenmp prime_openmp.c
    #then do a test run
    echo current thread count = $OMP_NUM_THREADS
    echo -------------
    ./prime_openmp

See the script thread_test.sh for an example of looping through values of $OPM_NUM_THEADS to show performance improvements as threads increase.    

    bash thread_test.sh
