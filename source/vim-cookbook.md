# Vim editor cookbook

## Introduction to the book

This book was created with a sole purpose of covering a cookbook or a
cheatsheet style recipe for powering your vim usage.

A certain level of basic comfort and mastery is assumed throughout.

By leveraging video this book aims to make things easy for the reader.
Also having written in book form with plenty of text to go with the
video the learning should be smooth and easy to grasp.

Let us dive in.


## How to exit vim?

Before we get started with the course, the key question I wish to answer
is how to exit vim.

Whilst doing a Google search for vim questions I found this on top of
the list. So let us first address that.

I show in the below video 3 ways.

- Ctrl-Z which suspends the job (works only in command mode)
- :wq which saves and exits
- :q! which exits without saving.

[![Exiting from vim](gifs/exiting.gif)](https://youtu.be/jjslfiW4Vrs)

Most people struggle due to not knowing if you are in command mode or
insert mode. That is a problem in vi.

In vim however you can clearly see that at the bottom left of the
screen.

## Reading text files into vim buffer

Vim is very powerful for dealing with other files in the file system. By
writing and reading between temporary files mostly in `/tmp` directory
we can easily copy paste instead of using the copy buffer supported by
vim which uses the `v` keystroke or the `y` or `yy` keys.


[![Reading from file](gifs/reading-file.gif)](https://youtu.be/r83OZ-AD8i0)

Once you read contents of a file you can do various things with it. You
can go to a particular line and insert the external file.

Next we see how we can fetch output of a command into vim buffer.

## Reading shell command output into vim

Reading files into vim buffer is cool. But what about reading output of
a shell command into vim?

This could be used with `curl` and `-q` switch like this.

```shell
:r !curl -q <url>
```

There are various tricks we can use too.

[![Reading shell command output](gifs/reading-ouput-cmd.gif)](https://youtu.be/qjH_KxOT1c0)

## Writing a part of buffer to a file

In this chapter we are simply exploring how vim can help you write out
portions of the buffer to the external file.

We can simply select using the `v` key or simply use colon command for
line ranges.

[![Writing buffer to file](gifs/writing-buffer-to-file.gif)](https://youtu.be/x3fr6xq6cWU)

Of course this means that you can write out the entire file to external
file too.

In case the file already exists, then vim will complain. You can google
for a solution or choose a different file.
 
(Let us keep things simple).

## Deleting lines 

In order to delete lines the simple motion `dd` on the line will do
fine. Keep pressing and deleting lines one by one.

The colon command with line range works too.

```
:4,80d
```

will delete lines 4 to 80 including both lines.

[![Deleting lines](gifs/deleting-lines.gif)](https://youtu.be/lsoPSCnNpjk)

In the video we see how we can delete easily and also using the `v`
stroke and `x` which helps us get rid of text as well.

`v` will help us delete portions of lines too.

## Search and replace


Vim is mostly used for search replace of variable names in programming
or in editing in which some string is to be replaced with some other
string.

Vim supports regular expressions and there are several special
characters.

So if your search string contains a `/` or `\` or `*` then these are
regular expression characters and in order to avoid trouble I simply do
this.

```shell
:%s#<search>#<replace>#
```

This will ensure that the special characters are not interpreted as such
and that they are deemed as regular text.

[![Search and replace](gifs/search-and-replace.gif)](https://youtu.be/gk5bsn_eLfE)

Of course search and replace also operates on regions just like any
other vim command that operates on ranges(mostly line ranges).

## Moving around the vim editing buffer

In vim, moving around the buffer is pretty cool. Usually people think of
this as voodoo.

You mostly move around using the `h`, `k`, `j` and `l` keys. But vim
allows you to move around with the 4 arrow keys on your keyboard as
well.

Then a full screen forward is a `Ctrl-F` and a full screen backward is
`Ctrl-B`. But you also have `Ctrl-d` for half screen forward and so on.

[![Small movement](gifs/small-movement.gif)](https://youtu.be/xkQiDOi73EM)

Then you have big movements like `gg` to go to top end of the buffer and
`G` to go to the very end.

You can also use `g` as a command to operate using movement.

[![Big movement](gifs/big-movement.gif)](https://youtu.be/it4H9bKFGb4)

Then you have the `Ctrl-E` and `Ctrl-y` to move forward and backward
regardless of where the cursor is. That is quite useful too.

Though I use less of that in my editing.

## Tabbed operation - open each file in own tab

Vim introduced multiple tab editing long ago around version 7.1 or so if
I am not mistaken.

Nowadays I almost always edit multiple files using the `vim -p *`
command line.

This opens limited files in separate tabs. If there are 50 files then 50
tabs can't be opened. In such cases you must depend on the next chapter
to go to next files pressing `:n` colon command.

[![Open a file per tab](gifs/open-multiple-tabs.gif)](https://youtu.be/j1FGZYVpajk)

Multi tab editing is pretty cool and I use it often.

You can also use this to power editing once you memorize how to move
across tabs.

## Tabbed operation - operate on all tabs

You can move across tabs using keys in the next chapter.

But the ability to operate on multiple tabs all at once comes in handy.

You can simply prefix the operation with the 

```shell
:tabdo <oper>
```

method.

That way you can do search and replace or deleting the first few lines
or last few lines or whatever you wish to do.

[![Operate on all tabs](gifs/operate-on-all-tabs.gif)](https://youtu.be/6IGeA5zz5bA)

Nowadays all Vim releases support tabs and please do not forget to power
your editing using tabs.

I still remember the days when Vim did not have tabs, now that is passe.

## Switching between tabs

Switching between tabs is really easy and it has an eerie similarity to
how you would switch panes in `tmux`.

But switching tabs is easily demonstrated below.

The keys to remember are 

- `gt`
- `gT`

These two are pressed in `command mode` to switch tabs forward or
backward.

[![Switching between tabs](gifs/switching-tabs.gif)](https://youtu.be/5eIb1bBN-xw)

Tabbed editing is really nice and takes very less time to master.

## Editing files without using tabs

In case you prefer to edit vim without using tabs or when using cscope
or some code referencing tool or when using `make` you have to learn how
to use the 

```shell
:e #

```

or the two commands we see,

```shell
:n
```
and 

```shell
:N
```
to go to next file and previous file respectively.

Since the file names are given at the bottom of the buffer things are
quite easy.

[![Editing files without tabs](gifs/switching-files-without-tabs.gif)](https://youtu.be/KoKDysYETdc)

## Power editing - Multiple undo and redo

Multiple undo and redo are pretty cool. But they were not a part of Vi
editor by Bill Joy.

This is what prompted Bram Moolenaar to write vim in the first place.
But nowadays this is standard feature in all web based drawing tools,
Google docs and so on.

[![Multiple undo/redo](gifs/multiple-undo.gif)](https://youtu.be/58EWeEXzSwg)

Pressing `u` will undo and `Ctrl-r` both in command mode will redo.

Your brain will go into a tizzy trying these keystrokes continuously.

But remember that colon commands are not considered for this. Only
editing keystrokes.

## Print source code into PDF or HTML

As a programmer using vim for everyday coding, you rarely have a need to
show your code to someone or to make a PDF to share with someone.

Use the `hardcopy` colon command for that.

Used like this,
```shell
:hardcopy > %.ps
```
This will make a `postscript file ` which can then be converted to PDF
using `ps2pdf` or something similar.

And the `:TOhtml` colon command is really amazing since the syntax
highlighting and dark mode are preserved as is.

Remember to 

```shell
:se background=dark
```

before printing to html.

[![PDF & HTML output of source](gifs/hardcopy.gif)](https://youtu.be/8ul0caRHz6Y)

## Using yank registers

Using yank registers is part and parcel of vim editing. All the time you
are copying text and cutting , deleting and pasting multiple times.

The `:reg` colon command lists all the copy buffers which you can use to
retrieve some accidental edit or deletion.

[![Copy registers](gifs/using-yank-registers.gif)](https://youtu.be/GwsZ4sMueAk)

Obviously this changes between vim sessions. If you have multiple vim
edits simultaneously the reg will change between them.

Use file reading and writing to copy paste between them if on same
machine.

## Using the v command to copy 

The `v` command is supposed to mean **visual**. But it is really
convenient to copy text and to cut also.

You can copy any region of text and the highlighted view makes it so
easy to work with Vim.

Unlike the magic `dd` and other things that do not show any visual
feedback.

[![Using 'v' command](gifs/using-v-command.gif)](https://youtu.be/GtVmGIat8Rk)

Once you copy you can paste with `p` as usual.

The `v` command also makes it incredibly easy to write to external text
files as we saw in one of the initial chapters.

It also helps us operate on the selected region and do various colon
commands.

## Enable syntax highlighting and line numbers

I can never work with source code or config files without syntax
highlighting. Vim made this a great convenience and there are syntax
files for every language, syntax and file type.

I am typing this book in markdown and vim clearly shows errors due to
syntax highlighting.

If you are not using syntax highlighting for coding, you are missing
something.

I also use line numbers for the same reason. 

[![Syntax highlight and line numbers](gifs/syntaxhighlight.gif)](https://youtu.be/nOPe1dxn3TQ)

Coding can be intense labor and very demanding on your nerves. With
syntax highlighting you can simplify and focus.

Of course there are multiple themes for highlighting colors.

You can find full list here.

```shell
$ ls /usr/share/vim/vim*/colors

blue.vim darkblue.vim default.vim delek.vim desert.vim elflord.vim evening.vim industry.vim koehler.vim lists morning.vim murphy.vim pablo.vim peachpuff.vim ron.vim shine.vim slate.vim tools torte.vim zellner.vim
```

In my case `vim*` is `vim82`. This will change based on each version.

To set a particular theme all you have to do is use the colon command, 

```shell
:colorscheme industry
```
and you can enjoy Vim editing even more.

## Spell checking

Spell checking is an amazing feature of vim which I use along with
`autocmd filetype` to ensure that I don't have a lot of highlights shown
in my source code text.

But when you are typing e-mails in mutt or something or writing an
article for your blog, then spell checking catches typos really well.

All you have to do is:

```
:se spell
```

And I normally have this in my `~/.vimrc` file.

But I also have `:se textwidth=72` for similar reasons.

You don't want the text files that do not wrap at line boundaries,
usually 72 characters.

[![Enable spell check](gifs/spellcheck.gif)](https://youtu.be/Y0N6j9iQT3I)

We are not talking of vimrc customizations in this book. That is a
separate topic on its own.

But spelling checks are best enabled using autocmd which is also
something I am not dwelling upon.

A simple colon command can turn spell check on and off just like line
numbers as we saw previously.

## Indentation of source code

Source code editing is close to impossible when indentation is not
correct. And languages like Python will not even compile or work without
proper indentation.

In order to help  you with this, the `=` keystroke in vim provides
indentation for most languages.

But for javascript I use `js-beautify` and use the colon command and
pipe it using the shell.

[![Indent source code](gifs/indentation.gif)](https://youtu.be/dre6oMkiqpY)

For most languages however, the key strokes `gg`, `v`, `G`, `=` will
indent the whole file.

The indent keystroke only works with motion commands and not colon
commands.

## Joining multiple lines

Joining multiple lines I learnt by accident.

Like most vim users. We use `j` for moving around the buffer and when
the caps lock is on, it ends up joining lines.

[![Join adjacent lines](gifs/join-lines.gif)](https://youtu.be/EcORiFphYz8)

But that is useful in case we want to do shell scripting or something
which does not work with line breaks between command invocations.

I also do not know if WYSIWIG editors give this functionality.

This is yet another cool feature of Vim in my view.

## Case inversion using ~ 

A simple `~` keystroke can reverse the case. Make upper case lowercase
and vice versa.

This is used with motion commands and so, using `v` is ideal.

Or you could use the `g` command too.

[![Invert case using ~](gifs/case-inversion.gif)](https://youtu.be/BuHqXMtrr5c)

This chapter was written with a view of introducing motion commands.

Most people do not use motion commands and use colon commands more
often.

But motion commands are quite fast and get your job done quicker. These
things help you become more efficient at editing.

Which is what vim is all about after all...

## Detecting tabs and newlines

When writing Python code we often run into various errors due to tabs
looking no different from spaces.

Or we might wonder if the line wrapped around or if there is really a
new line.

[![Show tabs and newlines](gifs/detecting-tabs-newlines.gif)](https://youtu.be/N6yFv1k9W9M)

In such cases this colon command

```shell
:se list
```

saves our day.

Once we finish our investigation you can turn it off using

```shell
:se nolist
```

Another useful tip is after doing a search and you want to highlight
matching strings.

```shell
:se nohlsearch
```

will come in handy for that.

## Conclusion

In this short cookbook we went through various power tools that vim
provides to improve our editing efficiency.

Using videos and text in conjunction must have helped you gain a better
understanding of Vim's power instead of text only tutorials or man
pages.

By the way

```shell
$ vimtutor
```

is a powerful tutorial on its own merit but does not talk of advanced
topics.

And

```shell
:help
```

This colon command is pretty cool too.


