#!/bin/bash

# Check if your cluster has vsearch installed

module load StdEnv VSEARCH/2.21.1-GCC-10.3.0

# Use vsearch to sort the sequences in uniques_10.fasta by size.
# The output will be written to uniques_10_sorted.fasta, including only sequences with a minimum length of 80 nucleotides (--minseqlength 80).

vsearch -sortbysize uniques_10.fasta --output uniques_10_sorted.fasta -minseqlength 80
