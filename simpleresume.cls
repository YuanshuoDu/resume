\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpleresume}[2024]

\LoadClass{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{fontenc}
\RequirePackage{lmodern}
\RequirePackage{textcomp}
\RequirePackage{microtype}
\RequirePackage{hyperref}

\geometry{a4paper,left=1.8cm,top=1.5cm,right=1.8cm,bottom=1.5cm}

% Modern color scheme - Deep Navy & Professional
\definecolor{primary}{RGB}{15,23,42}       % Dark slate - headings
\definecolor{accent}{RGB}{37,99,235}      % Blue 500 - section titles
\definecolor{secondary}{RGB}{100,116,139} % Slate 500 - secondary text
\definecolor{lightbg}{RGB}{248,250,252}   % Slate 50 - subtle bg
\definecolor{rule}{RGB}{226,232,240}      % Slate 200 - dividers

\hypersetup{
    colorlinks=true,
    linkcolor=accent,
    urlcolor=accent,
    pdfborderstyle={0 0 0}
}

\titleformat{\section}{
    \Large\bfseries\color{accent}
}{\thesection}{0.5em}{}

\titlespacing*{\section}{0pt}{1.2ex}{0.5ex}

% Itemize improvements
\RequirePackage{enumitem}
\setlist{noitemsep,topsep=0.2ex,partopsep=0pt}
\setlist[itemize]{leftmargin=1.2em,label=\textbullet}

\endinput
