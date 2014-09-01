#!/usr/bin/env bash

indir=$(cd $(dirname "$1"); pwd -P)
infile=$(basename "$1")
outdir=~/org
outfile=$(basename "$indir")
ext=${infile##*.}
updateScript=~/bin/updateTODO.sh
outfilepath=~/
origtodo="
"


echo $origFiles

for file in $origfiles
do
    cp -uv $infilepath $outdir/$(basename 
done
