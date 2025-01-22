#!/usr/local/bin/bash
find [12]??? -name '*.thumb.jpg' -print | sort > thumbs.txt
rm -f entries.txt
for f in `cat thumbs.txt`; do
    par=${f/.thumb.jpg/.par}
    jpg=${f/.thumb.jpg/.jpg}
    if [ -e $par -a -e $jpg ]; then
        printf "%s|%s|%s\n" $f $jpg $par >> entries.txt
        echo $f
    fi
done
rm -f thumbs.txt
