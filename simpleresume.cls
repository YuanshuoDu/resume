\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpleresume}[2024]

\LoadClass{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}
\RequirePackage{ragged2e}

% ── Font setup: use lmodern for PDFLaTeX compatibility ───────────────────────
\RequirePackage{lmodern}

% ── Professional color palette ───────────────────────────────────────────────
% Modern Tech Blue — confident, approachable, professional
\definecolor{primary}{RGB}{15,23,42}       % Deep navy — name, section headings
\definecolor{accent}{RGB}{37,99,235}      % Vivid blue — bullets, underline, top bar
\definecolor{accentlight}{RGB}{147,197,253} % Blue-300 — subtle tints
\definecolor{accentdark}{RGB}{29,78,216}   % Blue-700 — hover states
\definecolor{secondary}{RGB}{71,85,105}    % Slate-600 — company names, meta
\definecolor{muted}{RGB}{100,116,139}     % Slate-500 — muted / date labels
\definecolor{rule}{RGB}{226,232,240}       % Slate-200 — divider lines
\definecolor{headerbar}{RGB}{37,99,235}    % Same accent — top page bar
\definecolor{surface}{RGB}{248,250,252}   % Slate-50 — subtle background surfaces

% ── Page geometry ────────────────────────────────────────────────────────────
\geometry{a4paper,left=2.0cm,top=1.7cm,right=2.0cm,bottom=1.7cm}

% ── Hyperlinks ───────────────────────────────────────────────────────────────
\hypersetup{
  colorlinks=true,
  linkcolor=accent,
  urlcolor=accent
}

% ── Microtype ─────────────────────────────────────────────────────────────────
\microtypesetup{protrusion=true,expansion=true,tracking=mtc}

% ── Section titles: bold + left accent bar ───────────────────────────────────
\titleformat{\section}{%
  \large\sffamily\bfseries\color{primary}\raggedright
}{%
  \llap{\color{accent}\rule[0.18ex]{3pt}{1.05em}\hspace{0.38em}}% left accent bar
}{0em}{}
\titlespacing*{\section}{0pt}{2.0ex}{0.5ex}

% ── Itemize: accent-colored bullets with tighter spacing ───────────────────────
\setlist{noitemsep,topsep=0.1ex,partopsep=0pt,parsep=0pt}
\setlist[itemize]{leftmargin=0.9em,label=\color{accent}\textbullet,itemsep=0.08cm}

% ── Page top accent bar ───────────────────────────────────────────────────────
\AtBeginDocument{%
  \AddToShipoutPictureFG{%
    \put(0,\dimexpr\paperheight-\topmargin-1in-5pt\relax){%
      \textcolor{headerbar}{\rule{\paperwidth}{5pt}}%
    }%
  }%
}

% ── Double-rule header divider ────────────────────────────────────────────────
\newcommand{\headerrule}{%
  \par\noindent\textcolor{rule}{\rule{\linewidth}{0.7pt}}\par
  \nopagebreak\vspace{-0.5ex}%
  \par\noindent\textcolor{accent}{\rule{\linewidth}{1.8pt}}\par
  \nopagebreak\vspace{0.28cm}%
}

% ── Footer ───────────────────────────────────────────────────────────────────
\fancypagestyle{plain}{%
  \fancyfoot[C]{\sffamily\scriptsize\color{muted}\thepage}
  \fancyfoot[L,R]{}
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{plain}

% ── Compact entry helper ─────────────────────────────────────────────────────
% Usage: \entry{Title}{Company}{Date}{Description}
\newcommand{\entry}[4]{%
  \textbf{#1}
  \hfill {\sffamily\scshape\small\color{secondary}#3}\\
  {\itshape\color{accent}}#2%
  \vspace{-0.5mm}%
  \begin{itemize}
    #4
  \end{itemize}
  \vspace{0.15cm}
}

\endinput