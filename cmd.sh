#!/bin/sh

pandoc -f markdown+smart --toc -o book.epub metadata.txt source/vim-cookbook.md
ebook-convert book.epub book.pdf
rm book.epub
