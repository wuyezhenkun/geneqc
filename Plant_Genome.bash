#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

module load anaconda5/5.0.0-3.6


##data path: /pylon5/cc5fpcp/weiliang/BMBL/GeneQC/Plant_Genome/
##program path: /home/weiliang/BMBL/GeneQC-master/GeneQC_Python/


python /home/weiliang/BMBL/GeneQC-master/GeneQC_Python/GeneQC2.py 1 /pylon5/cc5fpcp/weiliang/BMBL/GeneQC/Plant_Genome/Athaliana_167_TAIR9.fa /pylon5/cc5fpcp/weiliang/BMBL/GeneQC/Plant_Genome/Athaliana_167_TAIR10.gene.gff3 /pylon5/cc5fpcp/weiliang/BMBL/GeneQC/Plant_Genome/SRR3305038.bam
