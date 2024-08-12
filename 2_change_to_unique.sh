#!/bin/bash

# This step is needed only if some duplicate sample names are found in the previous script

#This is the search pattern. It looks for lines that start with the character >:
#^ means "beginning of the line."
#> is the literal character we are searching for.
#s/\./_&_/':

#This is the substitution part.
#s/ indicates a substitution command.
#\. represents a literal dot . in the regular expression (since . usually means "any character," the \ is used to "escape" and indicate that we're looking for the literal dot).
#_&_ is the replacement pattern:
#_ inserts an underscore _ before the dot found.
#& refers to the text that matched the search pattern. In other words, it replaces the dot . found with the sequence ._.

sed '/^>/ s/\./_&/' pooled_upper_cleaned.fasta > pooled_upper_cleaned_unique.fasta
