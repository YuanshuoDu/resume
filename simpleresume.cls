\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpleresume}[2024]

\LoadClass{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{fontenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{hyperref}
\RequirePackage{enumitem}

% Professional color palette - Slate & Blue
\definecolor{primary}{RGB}{15,23,42}       % Dark slate - headings
\definecolor{accent}{RGB}{59,130,246}      % Blue 500 - accent
\definecolor{secondary}{RGB}{100,116,139}  % Slate 500 - secondary
\definecolor{muted}{RGB}{148,163,184}      % Slate 400 - muted
\definecolor{rule}{RGB}{226,232,240}       % Slate 200 - dividers

\geometry{a4paper,left=2cm,top=1.7cm,right=2cm,bottom=1.7cm}

\hypersetup{
    colorlinks=true,
    linkcolor=accent,
    urlcolor=accent
}

% Section title - bold with accent underline
\titleformat{\section}{\large\bfseries\color{primary}}{}{0em}{}

\titlespacing*{\section}{0pt}{2ex}{0.6ex}

% Itemize - clean bullets
\setlist{noitemsep,topsep=0.1ex,partopsep=0pt}
\setlist[itemize]{leftmargin=0.85em,label=\color{accent}\textbullet}

% Header rule
\newcommand{\headerrule}{\vspace{0.25cm}\hrule color{rule}\hrule\vspace{0.35cm}}

\endinput