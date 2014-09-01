#!/usr/bin/env bash

## This script updates the ~/org TODO files from various research
## projects that have been added by `sendToOrgDir.sh` script in the
## ~/bin folder.
## 
## The orgtodo variable is edited by the `sendToOrgDir.sh` file.  This
## script is set in the crontab to run frequently (~15 min) to update
## the TODO list.

date=$(date +"%F")
outdir=~/org
origtodo="
/home/luke/Documents/graduate/phd/duties/nsgsa/TODO.org
/home/luke/bin/prodigen/TODO.org
/home/luke/Documents/research-projects/sfaDiabetes/TODO.org
/home/luke/Documents/research-projects/renalProg/TODO.org

"

for file in $origtodo
do
    outfile=$outdir/$(basename $(dirname $file)).${file##*.}
    if [[ `diff -q $file $outfile` ]]
    then
        if [ $file -nt $outfile ]
        then
            cp -uv $file $outfile
        elif [ $outfile -nt $file ]
        then
            cp -uv $outfile $file
        fi
    fi
done

