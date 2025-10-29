#!/bin/bash
# Demonstrate variable usage and string manipulation in bash

echo ${where_am_i:=Edenburghe}
echo "Current value: $where_am_i"

# Replace first match
echo ${where_am_i/e/i}

# Replace all matches
echo ${where_am_i//e/i}

# String length
echo "Length: ${#where_am_i}"

