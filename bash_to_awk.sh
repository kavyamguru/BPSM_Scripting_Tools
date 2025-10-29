#!/bin/bash
# Pass bash variables into an AWK script

mycomputer="bioinfmsc8.bio.ed.ac.uk"
now=$(date +%d_%m_%Y)

ls -1 *awk* > myfiles.list
cat myfiles.list | awk -v Linuxbox=${mycomputer} -v now=${now} '{
  print "As of " now ", " Linuxbox " has " $1 " stored on it."
}'

