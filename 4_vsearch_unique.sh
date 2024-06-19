#!/bin/bash

# Check if your cluster has vsearch installed

module load StdEnv VSEARCH/2.21.1-GCC-10.3.0

# Use vsearch to perform dereplication on the pooled_upper.fasta file.
# The output will be written to uniques_10.fasta, including sequences that appear at least 10 times (--minuniquesize 10).
# The --sizeout option will include the size annotation in the output sequences, and --fasta_width 0 ensures no line wrapping in the output FASTA file.

vsearch --derep_fulllength merged_file.fasta --output uniques_10.fasta --minuniquesize 10 --sizeout --fasta_width 0

