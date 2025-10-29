#!/usr/bin/awk -f
BEGIN {
  FS="\t"; OFS="_";
}
{
  count++;
  if ($1 != "#") {
    print "Currently doing " count;
    total = total + ($12 * $3);
  }
}
END {
  print "Total = " total;
}

