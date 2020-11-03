\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{buk_uebung}[BuK Übungsaufgaben Abgabe]

\LoadClass[a4paper,11pt]{scrartcl}

\usepackage[a4paper, left=2cm, right=4.5cm, top=2cm, bottom=2cm]{geometry} % kleinere Ränder

%Paket für Header in Koma-Klassen (scrartcl, scrrprt, scrbook, scrlttr2)
\usepackage[headsepline]{scrlayer-scrpage}
% Header groß genug für 3 Zeilen machen
\setlength{\headheight}{3\baselineskip}

% Default Header löschen
\pagestyle{scrheadings}
\clearpairofpagestyles

% nicht kursiv gedruckte header
\setkomafont{pagehead}{\sffamily\upshape}

% Links im Dokuement sowie \url schön machen
\usepackage[colorlinks,pdfpagelabels,pdfstartview = FitH, bookmarksopen = true,bookmarksnumbered = true, linkcolor = black, plainpages = false, hypertexnames = false, citecolor = black]{hyperref}

% Umlaute in der Datei erlauben, auf deutsch umstellen
\usepackage[utf8]{inputenc}
\usepackage[ngerman]{babel}

% Mathesymbole und Ähnliches
\usepackage{amsmath}
\usepackage{mathtools}
\usepackage{amssymb}
\usepackage{microtype}
\newcommand{\NN}{{\mathbb N}}
\newcommand{\RR}{{\mathbb R}}
\newcommand{\QQ}{{\mathbb Q}}
\newcommand{\ZZ}{{\mathbb{Z}}}

% Komplexitätsklassen
\newcommand{\pc}{\ensuremath{{\sf P}}}
\newcommand{\np}{\ensuremath{{\sf NP}}}
\newcommand{\npc}{\ensuremath{{\sf NPC}}}
\newcommand{\pspace}{\ensuremath{{\sf PSPACE}}}
\newcommand{\exptime}{\ensuremath{{\sf EXPTIME}}}
\newcommand{\CClassNP}{\textup{NP}\xspace}
\newcommand{\CClassP}{\textup{P}\xspace}

\newcommand{\studentOne}{Erster Name 123456}
\newcommand{\studentTwo}{Zweiter Name 654321}
\newcommand{\studentThree}{Dritter Name 162534}
\newcommand{\uebungsnr}{0}
\newcommand{\setuebungsnr}[1]{\renewcommand{\uebungsnr}{#1}}
\newcommand{\tutorium}{99}
\newcommand{\gruppe}{42}

% Weitere pakete
\usepackage{multicol}
\usepackage{booktabs}

% Abbildungen
\usepackage{tikz}
\usetikzlibrary{arrows,calc}

% Meistens ist \varphi schöner als \phi, genauso bei \theta
\renewcommand{\phi}{\varphi}
\renewcommand{\theta}{\vartheta}

% Aufzählungen anpassen (alternativ: \arabic, \alph)
\renewcommand{\labelenumi}{(\roman{enumi})}

% rwth colors
% colors: blue violet purple carmine red magenta orange yellow grass cyan gold silver
\definecolor{rwth-blue}{cmyk}{1,.5,0,0}\colorlet{rwth-lblue}{rwth-blue!50}\colorlet{rwth-llblue}{rwth-blue!25}
\definecolor{rwth-violet}{cmyk}{.6,.6,0,0}\colorlet{rwth-lviolet}{rwth-violet!50}\colorlet{rwth-llviolet}{rwth-violet!25}
\definecolor{rwth-purple}{cmyk}{.7,1,.35,.15}\colorlet{rwth-lpurple}{rwth-purple!50}\colorlet{rwth-llpurple}{rwth-purple!25}
\definecolor{rwth-carmine}{cmyk}{.25,1,.7,.2}\colorlet{rwth-lcarmine}{rwth-carmine!50}\colorlet{rwth-llcarmine}{rwth-carmine!25}
\definecolor{rwth-red}{cmyk}{.15,1,1,0}\colorlet{rwth-lred}{rwth-red!50}\colorlet{rwth-llred}{rwth-red!25}
\definecolor{rwth-magenta}{cmyk}{0,1,.25,0}\colorlet{rwth-lmagenta}{rwth-magenta!50}\colorlet{rwth-llmagenta}{rwth-magenta!25}
\definecolor{rwth-orange}{cmyk}{0,.4,1,0}\colorlet{rwth-lorange}{rwth-orange!50}\colorlet{rwth-llorange}{rwth-orange!25}
\definecolor{rwth-yellow}{cmyk}{0,0,1,0}\colorlet{rwth-lyellow}{rwth-yellow!50}\colorlet{rwth-llyellow}{rwth-yellow!25}
\definecolor{rwth-grass}{cmyk}{.35,0,1,0}\colorlet{rwth-lgrass}{rwth-grass!50}\colorlet{rwth-llgrass}{rwth-grass!25}
\definecolor{rwth-green}{cmyk}{.7,0,1,0}\colorlet{rwth-lgreen}{rwth-green!50}\colorlet{rwth-llgreen}{rwth-green!25}
\definecolor{rwth-cyan}{cmyk}{1,0,.4,0}\colorlet{rwth-lcyan}{rwth-cyan!50}\colorlet{rwth-llcyan}{rwth-cyan!25}
\definecolor{rwth-teal}{cmyk}{1,.3,.5,.3}\colorlet{rwth-lteal}{rwth-teal!50}\colorlet{rwth-llteal}{rwth-teal!25}
\definecolor{rwth-gold}{cmyk}{.35,.46,.7,.35}
\definecolor{rwth-silver}{cmyk}{.39,.31,.32,.14}

% Header i-> inner (bei einseitig links), c -> center, o -> Outer (bei einseitg rechts)
\ihead{BuK WS 2020/21 \\ Tutorium 99 \\\today}
\chead{\Large Übungsblatt \uebungsnr}
\ohead{\studentOne \\
	   \studentTwo \\
	   \studentThree}
	
\cfoot*{\pagemark} % Seitenzahlen unten