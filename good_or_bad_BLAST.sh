#!/bin/bash
# Example: classify BLAST hits as good or bad based on e-value

unset IFS  # reset input field separator

cut -f1,12 blastoutput2.out | grep -v "#" | while read acc evalue; do
  # Convert scientific notation to floating number if possible
  if (( $(echo "$evalue < 0.001" | bc -l) )); then
    echo -e "${acc}\tGOOD"
  else
    echo -e "${acc}\tBAD"
  fi
done

