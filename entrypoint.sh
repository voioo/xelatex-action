#!/bin/sh
set -e

# Run XeLaTeX in non-stop mode and halt on errors
for file in $@; do
    echo "Compiling $file..."
    
    # First run
    xelatex -interaction=nonstopmode -halt-on-error "$file" || {
        echo "Error in first XeLaTeX run for $file"
        exit 1
    }
    
    # Second run to resolve references
    xelatex -interaction=nonstopmode -halt-on-error "$file" || {
        echo "Error in second XeLaTeX run for $file"
        exit 1
    }
    
    echo "Successfully compiled $file"
done
