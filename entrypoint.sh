#!/bin/sh
set -e

# Run XeLaTeX in non-stop mode and halt on errors
for file in $@; do
    echo "Compiling $file..."
    xelatex -interaction=nonstopmode -halt-on-error "$file"
done
