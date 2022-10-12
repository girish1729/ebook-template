# SoX cheat sheet

## General commands

- General usage.

```shell
$ sox [general_flags] [input_flags][infile] [output_flags][outfile] [effects...]
```

- Help on arguments for a particular effect.

```shell
$ sox --help-effect reverb
```
- Display general information (samplerate, bit depth, duration, ...)

```shell
$ sox --info input.wav
```

- Process the audio contents to calculate properties such as RMS.

```shell
$ sox input.wav -n stats
```

- Convert to 8kHz, 1-channel wav.

```shell
$ sox input.wav -r 8000 -c 1 output.wav
```

- Convert to mp3.

```shell
$ sox input.wav output.mp3
```

- Convert to mp3 with specified bitrate in kbps.

```shell
$ sox input.wav -C 256 output.mp3
```

- Convert from a .raw file of known format to a wav file.

```shell
$ sox -r 44100 -e signed-integer -b 16 chirp-raw-audio.raw chirp-raw-audio.wav
```

## Synthesizing audio

- Generate 1 second of white noise.

```shell
$ sox -n output.wav synth 1 noise
```

- Generate a 1-second sine tone.

```shell
$ sox -n output.wav synth 1 sine 440
```

- Generate a 10-second sine sweep.

```shell
$ sox -n output.wav synth 10 sine 0:20000
```

- Exponential sine sweep

```shell
$ sox -n -r 44100 sine-sweep.wav synth 10 sine 5/22050
```

- Dirac impulse

```shell
$ sox -n -r 44100 impulse.wav synth 1s square pad 0 44099s
```

## Playing audio

- Play an audio file through the default system audio output.

```shell
$ play input.wav
```

- Play synthesized audio.

```shell
$ play -n synth sine 440 trim 0 1 gain -12
```

## Combining audio

- Combine two files by concatenation.

```shell
$ sox a.wav b.wav c.wav concatenated.wav
```

- Combine two files by mixing their contents.

```shell
$ sox -m a.wav b.wav c.wav mixed.wav
```

## Modifying audio

- Reduce level by 12dB

```shell
$ sox speech.wav output.wav gain -12
```

- Crop to the first 1 second of the file.

```shell
$ sox speech.wav output.wav trim 0 1
```

- Reverse the contents.

```shell
$ sox speech.wav output.wav reverse
```

- Normalise the contents to 0dBFS.

```shell
$ sox speech.wav output.wav norm
```

## Effects

- Equaliser (-6dB @ 100Hz, -24dB @ 8000Hz)

```shell
$ sox speech.wav output.wav bass -6 100 treble -24 8000
```

- Add room modelling reverb.

```shell
$ sox speech.wav output.wav reverb 50 50 100
```

- Trim digital silence from start and end.

```shell
$ sox input.wav trimmed/output.wav silence 1 0.1 0 1 0.1 0
```

## Visualisation

- Generate a spectrogram (output to spectrogram.png)

```shell
$ sox speech.wav -n spectrogram
```


- Merge two audio files into one:

```shell
$ sox -m ${input_audiofile1} ${input_audiofile2} ${output_audiofile}
```

- Trim an audio file to the specified times:

```shell
$ sox ${input_audiofile} ${output_audiofile} trim ${start} ${end}
```

- Normalize an audio file
 (adjust volume to the maximum peak level, without clipping):

```shell
$ sox --norm ${input_audiofile} ${output_audiofile}
```

- Reverse and save an audio file:

```shell
$ sox ${input_audiofile} ${output_audiofile} reverse
```

- Print statistical data of an audio file:

```shell
$ sox ${input_audiofile} -n stat
```

## Filters


- Increase the volume of an audio file by 2x:

```shell
$ sox -v 2.0 ${input_audiofile} ${output_audiofile}
```

- Changing sample rate of a file

```shell
$ sox ${input_file} -r 16000 ${output_file}
```

- Changing the Number of Channels
 (For example: convert mono audio files to stereo)

```shell
$ sox ${mono_wav} -c 2 ${stereo_wav}
```

- Generate Different Types of Sounds
 ${len} - length of audio to synthesize, hh:mm:ss.frac
 ${freq} - frequencies at the beginning/end of synthesis in Hz
 ${type} is one of sine, square, triangle, sawtooth, trapezium, exp,
   [white]noise, pinknoise, brown-noise
 sox -n synth ${len} ${type} ${freq}

```shell
$ sox -r 8000 -n output.wav synth 3 sine 300-3300
```

- Speed up the Sound in an Audio File

```shell
$ sox input.wav output.wav speed 2.0
```
