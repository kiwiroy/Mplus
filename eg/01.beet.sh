#!/bin/sh

toplevel=$(git rev-parse --show-toplevel)
data=$toplevel/data
output=$toplevel/eg.out
name=$(basename $0 .sh)

mkdir -p $output

$toplevel/m+1 $data/beet.var $data/beet.dat \
    -m 3 28 2 3 $output/$name.out
