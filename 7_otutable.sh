#!/bin/bash

# Check if your cluster has vsearch installed

module load StdEnv VSEARCH/2.21.1-GCC-10.3.0

# Use vsearch to perform global alignment of sequences in pooled_upper.fasta against a database of OTUs in otus.fasta.
# Sequences with at least 97% identity (--id 0.97) to a sequence in the database are considered matches.
# The output OTU table will be written to otu_table.txt.

vsearch --usearch_global merged_file.fasta --id 0.97 --db otus.fasta --otutabout otu_table.txt
