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

# extract data for the filename
GRUPPE=$(cat config.tex | grep 'gruppe' | awk 'NR == 3 {print $1}' RS='{' FS='}')
if [[ $GRUPPE -lt 10 ]]; then
    GRUPPE="0$GRUPPE"
fi
if [[ $GRUPPE -lt 100 ]]; then
    GRUPPE="0$GRUPPE"
fi
TUTORIUM=$(cat config.tex | grep 'tutorium' | awk 'NR == 3 {print $1}' RS='{' FS='}')
if [[ $TUTORIUM -lt 10 ]]; then
    TUTORIUM="0$TUTORIUM"
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
    cd $ueb && pdflatex -halt-on-error main.tex > /dev/null 2>&1 && cd ..
    if [[ ! -f $ueb/main.pdf ]]; then
        log "ERR" "Failed to compile $ueb/main.tex"
        exit 1
    fi
    # extract further data for the filename
    UEBUNGSNUMMER=$(cat $ueb/main.tex | grep 'setuebungsnr' | awk 'NR == 2 {print $1}' RS='{' FS='}')
    if [[ $UEBUNGSNUMMER -lt 10 ]]; then
        UEBUNGSNUMMER="0$UEBUNGSNUMMER"
    fi
    # create filename
    FILENAME="Blatt-${UEBUNGSNUMMER}_Tutorium-${TUTORIUM}_Gruppe-${GRUPPE}.pdf"
    # copy and cleanup
    cp $ueb/main.pdf out/$FILENAME
    rm $ueb/main.pdf $ueb/main.aux $ueb/main.log $ueb/main.out
done