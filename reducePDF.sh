#!/bin/sh

# This script reduces the size of a pdf to a specified resolution.  It
# uses GhostScript.

filename=`basename $1`
dir=$(cd $(dirname "$1"); pwd -P)
outname=out_$filename
resolution=/screen

gs -sDEVICE=pdfwrite \
    -dPDFSETTINGS=$resolution \
    -q \
    -o $dir/$outname $dir/$filename

#rm $dir/$(basename "$1")
#mv $dir/$outname $dir/$(basename "$1")
