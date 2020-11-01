#!/usr/bin/env bash

# get all folders that are important to us
UEBUNGEN=$(find -type d -name ueb*)

# log function
log() {
    case $1 in
        "SUC")
            echo -ne "[\e[32mSUC\e[0m]"
            ;;
        "ERR")
            echo -ne "[\e[31mERR\e[0m]"
            ;;
        "INF")
            echo -ne "[\e[34mINF\e[0m]"
            ;;
        *)
            echo -ne "[$1]"
            ;;
    esac
    printf ": %s\n" "$2"
}

# ensure out directory exists
if [[ ! -d out ]]; then
    mkdir -p out
fi

# for each uebung
for ueb in $UEBUNGEN; do
    # check if tex file exists 
    if [[ ! -f $ueb/main.tex ]]; then
        log "ERR" "File $ueb/main.tex not found."
        exit 1
    fi
    log "INF" "Compiling $ueb/main.tex"
    # quiet compile
    cd $ueb && pdflatex main.tex > /dev/null 2>&1 && cd ..
    if [[ ! -f $ueb/main.pdf ]]; then
        log "ERR" "Failed to compile $ueb/main.tex"
        exit 1
    fi
    # copy and cleanup
    cp $ueb/main.pdf out/$ueb.pdf
    rm $ueb/main.pdf $ueb/main.aux $ueb/main.log $ueb/main.out
done