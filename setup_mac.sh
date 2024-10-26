#!/bin/bash

files=$(find . -type f -name "setup.sh" -perm -u=x)

for file in $files; do
(
    dir=$(dirname "$file")
    cd "$dir" || exit
    echo "Runing $file in $dir"
    ./setup.sh
)
done

