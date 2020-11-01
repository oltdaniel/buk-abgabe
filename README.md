# BuK Abgabe ![Compile Uebungen](https://github.com/oltdaniel/buk-abgabe/workflows/Compile%20Uebungen/badge.svg)

This repo uses the provided template of our university. I converted it into a
LaTeX Class file so it can be easier used across documents. Additionally I
added a config to extract the variables for the student names and exercise
number.

Import this project by visiting [`GitHub Import Repository`](https://github.com/new/import)
and provide the url `https://github.com/oltdaniel/buk-abgabe.git`. I would suggest
the repo name `buk-wise2021` and the repository state `private`.

> **NOTE**: I suggest getting a student account [here](https://education.github.com/pack) to
be able to have the full experience in a private repository.

## Structure

The different uebungen should follow the same direcotry name schema with `ueb`
followed by the uebungs number. You can change the different student names in
the file `config.tex`. Each uebungsblatt file should be called `main.tex`.

The minimal setup for one uebungsblatt is:

```latex
\documentclass{../template}
\input{../config.tex}

% set the uebungsnummer
\setuebungsnr{0}

\begin{document}
    % some smart words
\end{document}
```

## Script

For an easy build process of all files just execute `./build.sh`. It will output
all your files into `out/ueb*.pdf`. I will extend the client in the future to allow
single compiling processes and error messages. Currently the output of pdflatex will
be hidden.

## Requirements

In order to use this stuff:
- `linux` because windows sucks
- `pdflatex` and additional latex packages. I recommend installing `texlive-full` so you do not need to worry about this stuff anymore.

## Actions

I added a GitHub Action that will compile all files and upload them as an artifact
for each build. Example: [`initial commit`](https://github.com/oltdaniel/buk-abgabe/actions/runs/340581520).

## Copyright

> Contents of `example.tex` and every line that is part of it and has been reused
across the project is property of RWTH University and the original authors.

For everything else that I've changed and created: MIT License.
_just do what you'd like to do_