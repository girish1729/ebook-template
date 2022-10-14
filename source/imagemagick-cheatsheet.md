# ImageMagick Cheat Sheet



- TIFF to PNG:

```shell
$ mogrify -background black -format png -depth 8  Data/Training/Images/cancer_subset00/*.tiff
```

- SVG to PNG:

```shell
$ mogrify -background black -format png -depth 8 Data/Training/Labels/cancer_subset00/*.svg
```

- Resize:

```shell
$ mogrify -resize 50% Data/Training/Images/cancer_subset00/*.png
```

```shell
$ mogrify -resize 100% --transparent -strip -quality 90  Data/Training/Images/cancer_subset00/*.png
```

- jpeg reduce filesize

```shell
$ convert -resize 100%  -strip -quality 90  input.jpg out.jpg
```

#### png transpacent

```shell
$ convert -resize 100% -transparent  -strip -quality 90  input.png out.png
```

- GrayScale

```shell
 $ for file in Data/Training/Images/cancer_subset00/*.png; 
   do 
	convert $file  -colorspace Gray $file;
   done
```

#### SVG fill replace:

```shell
 $ find ./ -type f -name '*.svg' | xargs -I{} sed -i_old -n -e 's/polygon fill="none"/polygon fill="white"/g;p;' {}
```

- Gray to RGB

```shell
$ mogrify -type TrueColorMatte -define png:color-type=6  /Volumes/UUI/labels/normal/*.png

```
## Rotate 90

```shell
$ mogrify -rotate 90 /Volumes/UUI/images/rotate90/*.png
```

```shell
 $ mogrify -rotate 90 *.jpg
```

- Rename with prefix

```shell
 $ for filename in *.png; 
   do 
	mv "$filename" "prefix_$filename"; 
   done;
```

- Get image size, channel, alpha, depth, DPI

```shell
 $ identify -format '%w X %h %[channels] %[bit-depth] %x x %y\n' input.jpeg
```

#### Flip

#### Flop

#### Resize

- Batch operation

```shell
 $ mogrify -resize 750x750\! *.jpg 
```
- File Resize

```shell
 $ mogrify -define jpeg:extent=5100kb *.png
```

## Background Transparent

```shell
 $ convert input-with-solid-white-background-color.jpg -transparent white output-transparent.jpg
```

- append photos horizontally

```shell
$ convert *.jpg -append full_horizontally.jpg
```
- append photos vertically

```shell
$ convert *.jpg +append full_vertically.jpg
```

