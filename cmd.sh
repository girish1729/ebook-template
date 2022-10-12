#!/bin/sh

pandoc -f markdown+smart --toc --epub-embed-font=fonts/*.ttf -o
book.epub metadata.txt openssl-cheatsheet.md
ebook-convert book.epub book.pdf
rm book.epub
