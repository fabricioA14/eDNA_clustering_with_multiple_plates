#!/bin/bash

# This step is needed only if some duplicate sample names are found in the previous script

sed '/^>/ s/\./_&/' pooled_upper_cleaned.fasta > pooled_upper_cleaned_unique.fasta