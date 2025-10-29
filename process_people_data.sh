#!/bin/bash
# Filter example_people_data.tsv for a specific month and country

IFS=$'\t'
month=10
wantedcountry="Mozambique"
inputfile="example_people_data.tsv"
outputfile="Month.${month}.details"

rm -f *.details
count=0

while read name email city bday_day bday_month bday_year country; do
  if [[ -n "$name" && "$country" != "country" ]]; then
    if [[ "$bday_month" -eq "$month" ]]; then
      ((count++))
      echo -e "${count}\t${name}\t${bday_month}\t${country}" >> "$outputfile"
    fi
  fi
done < "$inputfile"

echo "Extracted $count records for month $month."

