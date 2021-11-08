#!/bin/bash
##SBATCH --time=30:00
#SBATCH --nodes=2
#SBATCH --ntasks=1
#SBATCH --mem=30G
#SBATCH --cpus-per-task=8  
#SBATCH -o log/slurmjob-%A-%a
#SBATCH --job-name=multisamtools_atac
#SBATCH --partition=short
#SBATCH --array=0-5


echo 'multisamtools'

# Handling errors
#set -x # debug mode on
set -o errexit # ensure script will stop in case of ignored error
set -o nounset # force variable initialisation
set -o verbose
#set -euo pipefail

#Set up whatever package we need to run with
module purge
module load gcc/4.8.4 python/2.7.9 numpy/1.9.2 samtools/1.3 deepTools/3.1.2


#Set up data directory
DATA="/home/users/student13/reults/bowtie2/"
echo "index = $DATABANK"

OUTPUT="$HOME"/results/atacseq/bowtie2
mkdir -p "$OUTPUT"
mkdir -p -m 700 "$SCRATCHDIR"
cd "$SCRATCHDIR"



# Run the program
multiBamSummary  --bamfiles  "$DATA_DIR"/*.bam  -o "$OUTPUT"/results.npz


#Move results from scratch to user one's directory
mv  "$SCRATCHDIR"/* "$OUTPUT"

echo "Stop job : "`date` >&2


