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

\geometry{a4paper,left=2cm,top=1.8cm,right=2cm,bottom=1.8cm}

% Refined professional color palette - Tech Blue professional
\definecolor{primary}{RGB}{15,23,42}       % Dark slate - main headings
\definecolor{accent}{RGB}{37,99,235}      % Blue 500 - section titles
\definecolor{secondary}{RGB}{71,85,105}   % Slate 600 - secondary text
\definecolor{muted}{RGB}{148,163,184}     % Slate 400 - muted text
\definecolor{rule}{RGB}{203,213,225}       % Slate 300 - dividers
\definecolor{highlight}{RGB}{239,246,255}  % Blue 50 - subtle highlight

\hypersetup{
    colorlinks=true,
    linkcolor=accent,
    urlcolor=accent
}

% Section title styling - clean with left accent bar
\titleformat{\section}{
    \large\bfseries\color{primary}
}{\thesection}{0.5em}{}

\titlespacing*{\section}{0pt}{1.5ex}{0.8ex}

% Itemize improvements - tighter, cleaner bullets
\setlist{noitemsep,topsep=0.15ex,partopsep=0pt}
\setlist[itemize]{leftmargin=1em,label=\color{accent}\textbullet}

% Header styling
\endinput