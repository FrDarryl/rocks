#!/bin/bash
#
usage="Usage: $0 TOML-filepath (e.g. CCC_English.toml) TOML-selector (e.g. CCC.Num10)";

if [ $# -ne 2 ]; then
    echo "${usage}";
    exit 1;
fi;

#txt=$(dasel -f RSV/RSV_2-Timothy.toml -s '2Tim3.16'|perl -lpe "s/^\"//"| perl -lpe "s/\"$//")
filepath=$1
selector=$2
text=`dasel -f "${filepath}" -s "${selector}" | perl -lpe 's/^\"//' | perl -lpe 's/\"$//'`
echo "${text@E}"
