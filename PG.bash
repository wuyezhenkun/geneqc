#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x



cd /pylon5/cc5fpcp/weiliang/BMBL/GeneQC/Plant_Genome/GeneQC_Python

module load anaconda5/5.0.0-3.6

python GeneQC2.py 1 Athaliana_167_TAIR9.fa Athaliana_167_TAIR10.gene.gff3 SRR3305038.bam
