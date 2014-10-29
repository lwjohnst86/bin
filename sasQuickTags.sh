#!/usr/bin/env bash

if [[ "$2" == "--header" ]]
then
    echo Adding header
    echo "/*!

    ...short title...

    * @author
    * @created

    */

/**

    ... long title of macro goes here...
    \\\\

    ... description of macro goes here...
    \\\\

    [Examples:] &

    * @param
    * @return

    */
$(cat $1)" > $1

elif [[ "$*" != "--header" ]]
then
    echo Replacing quick tags with real code
    sed -i -e 's/{{\(.*\)}}/<code>\1<\/code>/g' \
        -e 's/\[\(.*\)\]/<b>\1<\/b>/g' \
        -e 's/\\\\$/<p>/g' \
        -e 's/ &$/<br>/g' $1
fi

