#!/bin/sh
inotifywait -mrq -o ~/inotifywait.log -e attrib /subfind | while read file
do
subfinder /subfind
done

