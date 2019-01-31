#!/bin/sh

toplevel=$(git rev-parse --show-toplevel)
data=$toplevel
output=$toplevel/eg.out
name=$(basename $0 .sh)

mkdir -p $output

$toplevel/m+1 $data/beet.var $data/beet.dat \
    -a $output/$name.out
