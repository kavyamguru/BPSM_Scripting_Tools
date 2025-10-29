#!/bin/bash
# ==============================================================
# 🧠 BPSM08 – Eddie HPC Cheatsheet Script
# Author: Kavya Mg
# University of Edinburgh | MSc Bioinformatics
# Description: End-to-end practical guide + runnable examples
# ==============================================================

echo "=============================================================="
echo "🧬 WELCOME TO BPSM08 – EDDIE HPC CHEATSHEET"
echo "=============================================================="
echo
echo "This script demonstrates login, file transfer, job submission,"
echo "module loading, and monitoring commands on Eddie HPC."
echo "NOTE: Commented commands (with #) are for reference only."
echo

# --------------------------------------------------------------
# 🔐 1. LOGIN EXAMPLE (run manually from your local/MSc server)
# --------------------------------------------------------------
cat <<'EOF'

# Login to Eddie HPC
ssh sXXXXXXX@eddie.ecdf.ed.ac.uk

EOF

# --------------------------------------------------------------
# 📂 2. FILE TRANSFER USING SCP
# --------------------------------------------------------------
cat <<'EOF'

# Copy local file to Eddie home
scp myfile sXXXXXXX@eddie.ecdf.ed.ac.uk:/home/sXXXXXXX/

# Copy local file to Eddie scratch
scp myfile sXXXXXXX@eddie.ecdf.ed.ac.uk:/exports/eddie/scratch/sXXXXXXX/

# Copy file back from Eddie
scp sXXXXXXX@eddie.ecdf.ed.ac.uk:/exports/eddie/scratch/sXXXXXXX/myfile ./

# Copy an entire directory
scp -r myfolder/ sXXXXXXX@eddie.ecdf.ed.ac.uk:/home/sXXXXXXX/

EOF

# --------------------------------------------------------------
# ⚙️ 3. JOB SUBMISSION EXAMPLE
# --------------------------------------------------------------
cat <<'EOF' > hello.sh
#!/bin/bash
#$ -N Hello
#$ -l h_rt=00:01:00
#$ -l h_vmem=1G
#$ -o hello.o
#$ -e hello.e

echo "Hello from Eddie node: $(hostname)"
EOF

chmod 755 hello.sh

echo "✅ Created sample job script: hello.sh"
echo
echo "Submit job with:"
echo "   qsub hello.sh"
echo

# --------------------------------------------------------------
# 📊 4. JOB MONITORING COMMANDS
# --------------------------------------------------------------
cat <<'EOF'

# Check all jobs
qstat

# Watch job queue live
while true; do qstat; sleep 10; clear; done

# Delete a job by ID or name
qdel 51094327
qdel Hello

# View job accounting (after completion)
qacct -j 51094327

EOF

# --------------------------------------------------------------
# 🧩 5. MODULE SYSTEM
# --------------------------------------------------------------
cat <<'EOF'

# List available modules
module available

# Load Python or R
module load python/3.12.9
module load R/4.3.0

# Unload module
module unload python

EOF

# --------------------------------------------------------------
# 🧮 6. JOB ARRAY EXAMPLE
# --------------------------------------------------------------
cat <<'EOF' > array_job.sh
#!/bin/bash
#$ -t 1-10
#$ -N ArrayJob
#$ -l h_rt=00:01:00
#$ -l h_vmem=1G
#$ -o MyResults.$TASK_ID.o
#$ -e MyResults.$TASK_ID.e

echo "Running task ID $SGE_TASK_ID on $(hostname)"
EOF

chmod 755 array_job.sh

echo "✅ Created array job script: array_job.sh"
echo "Submit job array with:"
echo "   qsub array_job.sh"
echo

# --------------------------------------------------------------
# 🧰 7. TROUBLESHOOTING
# --------------------------------------------------------------
cat <<'EOF'

# If error like:
# unexpected EOF while looking for matching `'`
# -> check for unclosed quotes in script.

# Check error logs:
more hello.e
EOF

# --------------------------------------------------------------
# 🧾 8. USEFUL MAN PAGES
# --------------------------------------------------------------
cat <<'EOF'

man qsub
man qstat
man qdel

EOF

# --------------------------------------------------------------
# 📘 9. REFERENCES
# --------------------------------------------------------------
cat <<'EOF'

Eddie Documentation:
https://bioinfmsc8.bio.ed.ac.uk/AY25_BPSM08.html

Feedback form:
https://forms.office.com/r/dYGLLS7zfa

EOF

echo "=============================================================="
echo "✅ CHEATSHEET EXECUTED SUCCESSFULLY"
echo "Now you can explore, modify, and run example jobs on Eddie!"
echo "=============================================================="

