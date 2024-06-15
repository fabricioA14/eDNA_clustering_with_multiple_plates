#!/bin/bash

# Concatenate multiple FASTA files from different plates into a single merged file.
# This example includes files from five plates.
# The final merged file will be saved as merged_file.fasta.

cat /cluster/projects/nn9813k/Fabricio/PL03_Leray/pooled_upper_cleaned.fasta /cluster/projects/nn9813k/Fabricio/PL06_Leray/pooled_upper_cleaned.fasta /cluster/projects/nn9813k/Fabricio/PL12_Leray/pooled_upper_cleaned.fasta /cluster/projects/nn9813k/Fabricio/PL15_Leray/pooled_upper_cleaned_unique.fasta /cluster/projects/nn9813k/Fabricio/PL21_Leray/pooled_upper.fasta > merged_file.fasta
