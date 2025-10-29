#!/bin/bash
# ============================================================
# BPSM06: BLAST PRACTICAL — Automated Script
# Author: Kavya Mg (Bioinformatics MSc, UoE)
# Purpose: Retrieve sequence, create BLAST DB, run BLASTX,
#          and process results using AWK pipelines.
# ============================================================

# --- SECTION 1: Setup -------------------------------------------------
echo "🧬 Starting BPSM06 BLAST practical..."

# Create working directory (if not exists)
mkdir -p BPSM06_BLAST
cd BPSM06_BLAST || exit

# --- SECTION 2: Retrieve nucleotide sequence via wget -----------------
echo "📥 Downloading test sequence..."
weblink="https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=NC_015119.1&strand=1&seq_start=1426&seq_stop=2962&rettype=fasta&retmode=text"
wget -q -O testsequence.fasta "${weblink}"

if [[ -s testsequence.fasta ]]; then
  echo "✅ testsequence.fasta downloaded successfully."
else
  echo "❌ Failed to download testsequence.fasta."
  exit 1
fi

# --- SECTION 3: Prepare BLAST database --------------------------------
echo "🧱 Creating local BLAST database..."
# Example FASTA for BLAST (replace 'nem.fasta' with your protein FASTA)
if [[ ! -f nem.fasta ]]; then
  echo ">NemProteinExample
MSSSQNRPLVTLMLLLLTLVTMVSNAAKPEDYDE..." > nem.fasta
fi

makeblastdb -in nem.fasta -dbtype prot -out nem > /dev/null 2>&1
echo "✅ Database 'nem' created."

# --- SECTION 4: Run BLASTX --------------------------------------------
echo "⚡ Running BLASTX..."
blastx -db nem -query testsequence.fasta -out blastoutput2.out -outfmt 7

if [[ -s blastoutput2.out ]]; then
  echo "✅ BLASTX completed successfully."
else
  echo "❌ BLASTX failed or no output generated."
  exit 1
fi

# --- SECTION 5: Inspect and clean BLAST output -------------------------
echo "🔍 Filtering HSP lines..."
grep -v "#" blastoutput2.out > HSP_lines_only.out
echo "Saved filtered results to HSP_lines_only.out"

# --- SECTION 6: Basic AWK analyses ------------------------------------
echo "📊 Running AWK analyses..."

echo -e "\n1️⃣ First 20 HSPs with <20 mismatches:"
awk '($5 < 20 && $1 != "#")' blastoutput2.out | head -n 20

echo -e "\n2️⃣ Count of HSPs shorter than 100 amino acids:"
awk '($4 < 100 && $1 != "#")' blastoutput2.out | wc -l

echo -e "\n3️⃣ Top 10 HSPs by score (fields 1, 2, 12):"
awk '($1 != "#")' blastoutput2.out | cut -f1,2,12 | head -n 10

# --- SECTION 7: Calculate mismatch percentages ------------------------
echo -e "\n📈 Calculating mismatch percentages:"
grep -v "#" blastoutput2.out | \
awk '{
  HSP_mm_pc = ($5 / $4) * 100;
  printf "Mismatch%%: %.2f\n", HSP_mm_pc;
}' | head -n 10

# --- SECTION 8: Example pipeline using cut/sort/uniq ------------------
echo -e "\n🪣 Counting duplicate subject IDs:"
cut -f2 blastoutput2.out | sort | uniq -c | awk '($1 > 1)' | wc -l

# --- SECTION 9: Wrap up ----------------------------------------------
echo -e "\n🎉 BPSM06 BLAST practical completed successfully!"
echo "Results summary:"
ls -lh blastoutput2.out HSP_lines_only.out 2>/dev/null

# End of script
# ============================================================

