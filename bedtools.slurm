#!/bin/bash
##SBATCH --time=30:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=16G
#SBATCH --cpus-per-task=8  
#SBATCH -o log/slurmjob-%A-%a
#SBATCH --job-name=bowtie2_atac
#SBATCH --partition=short
#SBATCH --array=0-5

# Program configuration
__author__'watil nezha'
__email__='nezha.watil@gmail;com'

# Load the environment variables
module purge
module load spartan_2019
module load foss/2019b
module load bedtools/2.27.1

#Set up data directory
DATA="/home/users/student13/results/atacseq"
echo "index = $DATA"

OUTPUT="$HOME"/results/atacseq/bedtools
mkdir -p "$OUTPUT"
mkdir -p -m 700 "$SCRATCHDIR"
cd "$SCRATCHDIR"

#run program
bedtools intersect -a bedtools intersect -a /home/users/student13/results/atacseq/50k_0h_R2_summits.bed -b /home/users/student13/results/atacseq/50k_24h_R1_summits.bed /home/users/student13/results/atacseq/50k_24h_R1_summits.bed /home/users/student13/results/atacseq/50k_24h_R3_summits.bed.bed




#Move results from scratch to user one's directory
mv  "$SCRATCHDIR"/* "$OUTPUT"
