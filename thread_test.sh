#!/bin/bash -login
# compiles openmp c code that counts primes, then extracts timing data from output
# for different numbers of threads

# first compile the program 
echo COMPILING prime_openmp
gcc -o prime_openmp -fopenmp prime_openmp.c


#then do a test run
echo .
echo TEST RUN OF prime_openmp with current value of OMP_NUM_THREADS
echo current thread count = $OMP_NUM_THREADS
echo -------------
./prime_openmp


# setting OMP_NUM_THREADS env variable controls how many threads
# openmp will take.  By default on HPC OMP_NUM_THREADS=1 for safety

echo .
echo TIMING test of prime_openmp with various num of threads
echo to find number of primes less than 500000
echo note program will run for a long time at first before you see output
echo ------------
for THREADCOUNT in 1 2 4 8 16
do 
 echo $THREADCOUNT
 export OMP_NUM_THREADS=$THREADCOUNT
 # 500000 is high number in the stock C code above
 # so get just that line and extract the timing from column 3
 ./prime_openmp |grep  500000 |awk '{print $3}'
done


 for THREADCOUNT in 1 2 4 8 16; do echo $THREADCOUNT; export OMP_NUM_THREADS=$THREADCOUNT; ./prime_openmp |grep  500000 |awk '{print $3}';done
