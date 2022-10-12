#!/bin/sh

pandoc -f markdown+smart --toc -o book.epub metadata.txt source/sox-cheatsheet.md
ebook-convert book.epub book.pdf
rm book.epub
