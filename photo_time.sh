#!/bin/bash

for dir in ./*/
do
    # Extract the date from the directory name
    date=$(basename "$dir")

    # Convert the date to the format expected by touch and jhead
    formatted_date=$(date -jf "%Y-%m-%d" "$date" "+%Y%m%d%H%M.%S")

    # Change the modification and access times of all photos in the directory
    find "$dir" -type f -exec touch -t "$formatted_date" {} \;

    # Change the EXIF date of all photos in the directory
    find "$dir" -type f -iname "*.jpg" -exec jhead -ds"$formatted_date" {} \;
done
