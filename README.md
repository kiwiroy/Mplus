[![Build Status](https://travis-ci.org/NCGRP/Mplus.svg?branch=master)](https://travis-ci.org/NCGRP/Mplus)

# Mplus

C++ program that implements M+ optimization algorithm for core collection assembly

## Installation
To compile:  use `make`

## Usage

    m+1 varfile datfile [-m mincoresize maxcoresize samplingfreq reps outputfile] [-r] 
        [-k kernelfile] [-a idealcorefile]
where

* varfile = path to MSTRAT .var file
* datfile = path to MSTRAT .dat file

### Options

    -m mincoresize maxcoresize samplingfreq reps outputfile = compute the optimal accessions
       for a given core size using the M+ search algorithm. Arguments are as follows:
       mincoresize maxcoresize = integers specifying minimum and maximum core size. 
       Usually mincoresize = 2, maxcoresize = total number of accessions
       samplingfreq = e.g. integer value 5 will cause coresize=2 then coresize=7, then 12, 
       and so on, to be sampled.
       reps = number of replicate core sets to calculate for a particular core size
       outputfile = path to output
    -r use rarefaction to correct for differences in sample size of accessions, applies to
       M+ algorithm only.
    -k kernelfile = use an MSTRAT .ker file to specify mandatory members of the 
       core.  The number of mandatory accessions must therefore be less than or equal to 
       mincoresize.  Option only applies to -m, and cannot be used with -a.
    -a idealcorefile = compute the minimum set of accessions necessary to retain all variation,
       i.e. the "ideal" or "best" core, using the A* search algorithm, write output to 
       idealcorefile.

**Notes** Missing data must be coded as `9999`. To validate input files, omit all
options. `m+1` uses OpenMP for parallelization on multicore machines. Default is
single core M+ algorithm, and multicore A* algorithm.  To change behavior,
modify variable `parallelism_enabled` in file [`m+.cpp`](https://github.com/NCGRP/Mplus/blob/4381af9396263ca2ea3d4b58f1cb25d6a0d0b8ca/m%2B.cpp#L1313).

### Examples

    ./m+1 ./data/beet.var ./data/beet.dat -m 3 28 2 3 ./data/beetout.txt
    ./m+1 ./data/beet.var ./data/beet.dat -m 3 28 2 3 ./data/beetoutk.txt -k ./data/beet.ker
    ./m+1 ./data/beet.var ./data/beet.dat -a ./data/beetideal.txt
    ./m+1 ./data/orientalis.var ./data/orientalisIND.dat -m 2 50 1 1 ./data/orINDout.txt
    ./m+1 ./data/orientalis.var ./data/orientalisIND.dat -a ./data/orINDidealout.txt
    ./m+1 ./data/WheatSNP.var ./data/WheatSNP.dat -m 20 21 1 20 ./data/WheatSNPout.txt
    ./m+1 ./data/At.var ./data/At.dat -m 2 10 1 1 ./data/Atout.txt
    ./m+1 ./data/At.var ./data/At.dat -m 2 10 1 1 ./data/Atoutr.txt -r


**See also** the example scripts in the [`eg`](eg/) directory.
