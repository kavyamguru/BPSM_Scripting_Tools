#!/usr/bin/env python3
# ================================================================
# BPSM PYTHON CHEATSHEET (BPSM11–14)
# MSc Bioinformatics – University of Edinburgh
# Author: Kavya Mg
# Date: 2025-10-29
# Description:
#   Unified Python practice file covering strings, files, lists,
#   loops, and conditionals, including mini bioinformatics tasks.
# ================================================================

# ----------------------------
# SECTION 1 — STRINGS & VARIABLES
# ----------------------------

print("\n=== SECTION 1: STRINGS & VARIABLES ===")

# Variables and assignments
organism = "Saccharomyces cerevisiae"
gene = "ADH1"
length = 3450

print(f"Organism: {organism}, Gene: {gene}, Length: {length}")

# String concatenation and repetition
sequence = "ATGC" * 3
print("Repeated sequence:", sequence)

# Case changes
print("Uppercase:", gene.upper())
print("Lowercase:", organism.lower())

# Substring search and replace
print("Replace:", organism.replace("cerevisiae", "pombe"))
print("Find position of 'A':", sequence.find("A"))
print("Count of 'G':", sequence.count("G"))

# DNA complement (basic)
dna = "ATGCGTAACGTT"
complement = dna.replace("A","t").replace("T","a").replace("C","g").replace("G","c").upper()
print("DNA:", dna)
print("Complement:", complement)

# A+T content
at_content = (dna.count("A") + dna.count("T")) / len(dna)
print(f"AT content = {at_content:.2%}")

# ----------------------------
# SECTION 2 — FILE HANDLING & OS OPERATIONS
# ----------------------------
import os, shutil, subprocess

print("\n=== SECTION 2: FILES & OS ===")

# Create and write to a file
filename = "sequence_data.txt"
with open(filename, "w") as f:
    f.write(">seq1\nATGCGTAGCTAG\n>seq2\nATGCTAGCATTA\n")

print(f"File '{filename}' created.")

# Read contents
with open(filename) as f:
    contents = f.read()
print("File contents:\n", contents)

# Split by lines
with open(filename) as f:
    for line in f:
        print("Line:", line.rstrip())

# File operations
os.makedirs("output_files", exist_ok=True)
shutil.copy(filename, "output_files/copied_sequence.txt")
print("Copied to output_files/copied_sequence.txt")

# System call (listing)
print("System call example:")
subprocess.run(["ls", "-lh", "output_files"])

# ----------------------------
# SECTION 3 — LISTS & LOOPS
# ----------------------------

print("\n=== SECTION 3: LISTS & LOOPS ===")

# Define list and access elements
genes = ["ADH1", "COX1", "CYT1", "ATP6"]
print("All genes:", genes)
print("First gene:", genes[0])

# Append and extend
genes.append("HSP82")
genes.extend(["LEU2", "HIS3"])
print("Updated list:", genes)

# Sort and reverse
genes.sort()
print("Sorted:", genes)
genes.reverse()
print("Reversed:", genes)

# For loop over list
for gene in genes:
    print(f"Gene: {gene}")

# Example: counting GC in multiple DNA sequences
sequences = ["ATGCATGC", "GGGGCCCC", "ATATATAT"]
for seq in sequences:
    gc = (seq.count("G") + seq.count("C")) / len(seq)
    print(f"Sequence: {seq}, GC% = {gc:.1%}")

# Nested loops
print("\nMultiplying numbers:")
for i in range(1, 4):
    for j in range(1, 4):
        print(f"{i} x {j} = {i*j}")

# ----------------------------
# SECTION 4 — CONDITIONALS
# ----------------------------

print("\n=== SECTION 4: CONDITIONALS ===")

x, y = 5, 10
if x < y:
    print(f"{x} is less than {y}")
elif x == y:
    print("Equal values")
else:
    print(f"{x} is greater than {y}")

# Check if item in list
if "ATP6" in genes:
    print("ATP6 found in gene list!")

# Nested if example
temp = 37
if temp > 30:
    if temp < 40:
        print("Within biological temperature range.")
    else:
        print("Too hot!")
else:
    print("Too cold!")

# While loop
print("While loop example:")
count = 0
while count < 3:
    print("Count =", count)
    count += 1

# ----------------------------
# SECTION 5 — MINI BIOINFORMATICS TASKS
# ----------------------------

print("\n=== SECTION 5: MINI BIOINFORMATICS TASKS ===")

# 1. Parse FASTA and calculate AT content per sequence
def calc_at_content(fasta_file):
    with open(fasta_file) as f:
        name, seq = "", ""
        for line in f:
            line = line.strip()
            if line.startswith(">"):
                if seq:
                    at = (seq.count("A") + seq.count("T")) / len(seq)
                    print(f"{name}: AT% = {at:.1%}")
                    seq = ""
                name = line[1:]
            else:
                seq += line
        if seq:
            at = (seq.count("A") + seq.count("T")) / len(seq)
            print(f"{name}: AT% = {at:.1%}")

calc_at_content(filename)

# 2. K-mer counting (length = 3)
seq = "ATGCTAGCATGCGT"
k = 3
kmers = {}
for i in range(len(seq) - k + 1):
    kmer = seq[i:i+k]
    kmers[kmer] = kmers.get(kmer, 0) + 1
print("3-mer counts:", kmers)

# 3. Conditional filtering on GC content
gc = (seq.count("G") + seq.count("C")) / len(seq)
if gc > 0.5:
    print(f"Sequence is GC-rich ({gc:.1%})")
else:
    print(f"Sequence is AT-rich ({gc:.1%})")

# ----------------------------
# END OF SCRIPT
# ----------------------------
print("\n✅ End of BPSM Python Cheatsheet execution.")

