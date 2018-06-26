Matrix Multiplication Example with C Kernel
================================
[Switch to the English version](./README.md)

This is an implementation of performing matrix multiplication of two 16x16 matrices and getting the result back in 16x16 matrix. 
The main algorithm characteristics of this application are:

Files in the Example
---------------------
Application host code

* test-cl.cpp

Compilation File
--------------------------------
* Makefile : Makefile for compiling application

Note
--------------------------------
* SDx must be already installed and then xcpp tool can be available 


Compile host and Run the **run.sh** command to test hardware. The detailed procedure is as follows:
--------------------------------

```
make
sh run.sh mmult bin_dir/bin_mmult_hw.xclbin

```

