#!/bin/bash
# Demonstrate for-loops and nested loops

# Simple loop
for animal in cat dog llama; do
  echo ${animal}
done

# Loop with sequence expansion
for number in {0..20..5}; do
  echo -e "${number}\t${animal}"
done

# Nested loop example
unset count
for number in {1..4}; do
  for animal in cat dog llama; do
    count=$((count+1))
    echo -e "${count}\t${number}\t${animal}"
  done
done

