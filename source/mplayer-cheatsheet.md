# Mplayer cheatsheet

- Create an animation from a series of static images

- To combine all png images in a directory to create an avi movie do this:

```shell
$ mencoder mf://*.png -mf w=400:h=400 -ovc lavc -lavcopts vcodec=xvid -of avi -o output.avi
```
- Split a video in a series of static images
To split up an input movie into a subdir "dirname" with a special quality.

```shell
$ mplayer input.avi -vo jpeg:outdir=dirname:quality=80
```
- Join/Merge multiple videos

To join two or more video files into one, do this:

```shell
$ mencoder -oac copy -ovc copy -idx -o whole.avi part1.avi part2.avi ...
```

