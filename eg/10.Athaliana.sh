#!/bin/sh

toplevel=$(git rev-parse --show-toplevel)
data=$toplevel
output=$toplevel/eg.out
name=$(basename $0 .sh)

mkdir -p $output

$toplevel/m+1 $data/At.var $data/At.dat \
    -m 2 10 1 1 $output/$name.out
