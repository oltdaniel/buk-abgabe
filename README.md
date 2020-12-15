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

If you wanto to only compile a single folder, use `./build.sh <UEBNR>` where `<UEBNR>`
is equal to the digit combination in your folder `ueb<UEBNR>`. _(Maybe I'll update this
to be more user-friendly if we enter 2 digit numbers.)_

## Requirements

In order to use this stuff:
- `linux` because windows sucks
- `pdflatex` and additional latex packages. I recommend installing `texlive-full` so you do not need to worry about this stuff anymore.

## Actions

I added a GitHub Action that will compile all files and upload them as an artifact
for each build. Example: [`initial commit`](https://github.com/oltdaniel/buk-abgabe/actions/runs/340581520).

If you require a full texlive setup with all packages, consider changing the `compile.yml`.

```diff
# ...
-      - uses: xu-cheng/texlive-action/small@v1
# change this to:
+      - uses: xu-cheng/texlive-action/full@v1
```

### E-Mails with the PDFs

The current action is only upload the PDFs as an .zip which can only be downloaded through
the github website. This is ugly and not useful. That is why, you can add some lines and
store some secrets in your fork/private repo and receive emails that always include all pdfs.

1. **Add some code**: Open `.github/workflows/compile.yml` and append this code:
```yaml
# other action stuff
      - name: Extract pdf filenames
        id: extract-filenames
        run: |
          FILENAMES=$(find ./out -type f -name "*.pdf" | tr '\n' ',')
          echo "Found $FILENAMES"
          echo "::set-output name=PDFS::${FILENAMES%,}"
          echo "::set-output name=COMMIT::$(git log --format=%B -n 1 $GITHUB_SHA)"
      - name: Send email with all pdfs
        uses: dawidd6/action-send-mail@v2
        with:
          server_address: m.oltdaniel.at
          server_port: 465
          username: ${{secrets.MAIL_USERNAME}}
          password: ${{secrets.MAIL_PASSWORD}}
          subject: Automated BuK PDFs
          body: ${{steps.extract-filenames.outputs.PDFS}}
          from: ${{secrets.MAIL_USERNAME}}
          to: ${{secrets.MAIL_RECEIVERS}}
          attachments: ${{steps.extract-filenames.outputs.PDFS}}
```

2. **Change server**: Make sure to change the server settings.
```diff
-          server_address: m.oltdaniel.at
-          server_port: 465
+          server_address: smtp.gmail.com
+          server_port: 25 # don't use this port
```

3. **Secrets**: We need 3 secrets. `MAIL_USERNAME`, `MAIL_PASSWORD` and `MAIL_RECEIVERS`.
  You can add those in your repository settings under Secrets. `MAIL_USERNAME` and `MAIL_PASSWORD`
  will represent your login crendetials to your mail service. `MAIL_RECEIVERS` is a comma separated
  list of receivers that you will send this email to.

4. **Done.** Start writing some smart words into your TeX documents.

## Copyright

> Contents of `example.tex` and every line that is part of it and has been reused
across the project is property of RWTH University and the original authors.

For everything else that I've changed and created: MIT License.
_just do what you'd like to do_