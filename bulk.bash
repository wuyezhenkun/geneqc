#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x



cd /pylon5/cc5fpcp/weiliang/BMBL/GeneQC/bulk/GeneQC_Python

module load anaconda5/5.0.0-3.6

python extract_transcript_seq_gff.py GCF_000001405.37_GRCh38.p11_genomic.fna GCF_000001405.37_GRCh38.p11_genomic.gff human_transcripts_seq.fa human_transcripts_seq.gff

module load hisat2/2.0.4
hisat2-build -f human_transcripts_seq.fa ./hisatindex/Humo
hisat2 -x ./hisatindex/Humo -k 10 -p 40 -1 SRR6029567_1.fastq -2 SRR6029567_2.fastq -S SRR6029567.bam

python GeneQC2.py 2 human_transcripts_seq.fa human_transcripts_seq.gff SRR6029567.bam
