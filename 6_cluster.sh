#!/bin/bash

# Check if your cluster has vsearch installed

module load StdEnv USEARCH/11.0.667-i86linux32
module load StdEnv VSEARCH/2.21.1-GCC-10.3.0

#ZOTUS

usearch -unoise3 uniques_10_sorted.fasta -zotus otus.fasta -tabbedout unoise3_10.txt -relabel ASV -minsize 2

#OR

#OTUS

#vsearch --cluster_fast uniques_10_sorted.fasta --id 0.99 --centroids otus_.fasta --relabel Otu

#Filter out clusters with only one member #this chunk eliminates singletons
#awk '/^>/{if (NR>1) printf "\n"; printf "%s\n", $0; next}{printf "%s", $0} END {printf "\n"}' otus_.fasta > otus.fasta


