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

\geometry{a4paper,left=1.8cm,top=1.6cm,right=1.8cm,bottom=1.6cm}

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

% Section title styling with left accent bar effect
\titleformat{\section}{
    \Large\bfseries\color{primary}
}{\thesection}{0.5em}{}

\titlespacing*{\section}{0pt}{2ex}{0.8ex}

% Itemize improvements - cleaner, tighter
\setlist{noitemsep,topsep=0.1ex,partopsep=0pt}
\setlist[itemize]{leftmargin=0.9em,label=\color{accent}\textbullet}

% Command for section divider line
\newcommand{\sectionrule}{\nopagebreak\vspace{0.1ex}\par\color{accent}\rule{\linewidth}{0.5pt}\vspace{0.2ex}\par}

\endinput