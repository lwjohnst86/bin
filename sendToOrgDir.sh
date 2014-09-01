#!/usr/bin/env bash

## This script takes a file as an argument, renames it according to
## the parent directory name, and then sends it to the org file
## directory.  I need some way to be able to uniquely name my
## research-project TODO.org files so that I have it on my MobileOrg +
## agenda view.  The updateScript -> updateTODO.sh script will be
## update the sent TODO files via crontab

indir=$(cd $(dirname "$1"); pwd -P)
infile=$(basename "$1")
outdir=~/org
outfile=$(basename "$indir")
ext=${infile##*.}
updateScript=~/bin/updateTODO.sh

cp -vu $indir/$infile $outdir/$outfile.$ext
sed -i -e "/origtodo=/a $indir\/$infile" $updateScript
