#!/bin/bash
# BPSM02: Linux1 — Basic Command Practice

# 1. Send text to the screen
echo "This is a lecture on Linux"

# 2. Send text to a new file
echo "We are in a lecture" > somenewfile.txt

# 3. Append more text to the same file
echo "Today is Friday" >> somenewfile.txt

# 4. List files
ls -l

# 5. Copy the file
cp somenewfile.txt anotherfile.txt

# 6. View details
ls -l

# 7. Copy a data file from another directory
cp /localdisk/data/BPSM/Lecture02/example_people_data.tsv anotherfile.txt

# 8. Create a folder
mkdir MyFolder1

# 9. Move a file into that folder
mv somenewfile.txt MyFolder1

# 10. Show contents of directory, sorted by time
ls -lrt

# 11. Example of pipes
echo "Hello world" > somefile
echo "Hello world" >> somefile

# 12. nohup examples
nohup ls
nohup ls -al > files_I_have.txt
nohup my_cool_script.sh > my_script_results.xls
#!/bin/bash
# BPSM03: Linux2 — awk and pipe exercises

# Example 1 — simple awk
echo -e "The prickly hedgehog was hibernating." | awk 'BEGIN{FS=" "}{print NF}'

# Example 2 — field separator as letter 'i'
echo -e "The prickly hedgehog was hibernating." | awk 'BEGIN{FS="i"}{print NF}'

# Example 3 — with tab character
echo -e "The prickly hedgehog \t was hibernating." | awk 'BEGIN{FS=" "}{print NF}'

# Example 4 — tab as field separator
echo -e "The prickly hedgehog \t was hibernating." | awk 'BEGIN{FS="\t"}{print NF}'

# My first short awk script
awk 'BEGIN{FS="\t";}
{
  if(substr($3,1,3) == "Uni") {print $1;}
}' file1 >> file2

# Example pipes
cat anotherfile | grep "uk" | awk '($1=="Madonna")'
cat anotherfile | grep "uk" | awk '($6==1991)' | wc -l
cat anotherfile | grep "uk" | awk '{if($6==1991){print $1}}'

