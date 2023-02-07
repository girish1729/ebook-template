#!/bin/sh

pandoc -f markdown+smart --toc -o book.epub metadata.txt source/solopreneur-lifestyle.md
ebook-convert book.epub book.pdf
rm book.epub
