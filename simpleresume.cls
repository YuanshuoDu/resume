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

% ── Font setup: lmodern (pdflatex-compatible) + micro-typographic refinements ──
\RequirePackage{lmodern}
\RequirePackage{textcomp}% extra symbols companion

% ── Refined professional color palette ────────────────────────────────────────
% Slightly deeper, more refined — better contrast and hierarchy
\definecolor{primary}{RGB}{10,15,35}       % Deeper navy — name, section headings
\definecolor{accent}{RGB}{29,74,196}       % Royal blue-700 — bullets, bars, links
\definecolor{accentlight}{RGB}{239,246,255} % blue-50 — very subtle tint
\definecolor{accentmid}{RGB}{191,219,254}  % blue-200 — divider accent
\definecolor{secondary}{RGB}{51,65,85}     % Slate-700 — company, meta
\definecolor{muted}{RGB}{100,116,139}      % Slate-500 — dates, muted labels
\definecolor{rule}{RGB}{226,232,240}       % Slate-200 — light dividers
\definecolor{headerbar}{RGB}{29,74,196}    % Same accent — top page bar
\definecolor{surface}{RGB}{248,250,252}    % Slate-50 — subtle surfaces
\definecolor{surface2}{RGB}{241,245,249}   % Slate-100 — slightly darker surface

% ── Page geometry ────────────────────────────────────────────────────────────
\geometry{a4paper,left=1.9cm,top=1.6cm,right=1.9cm,bottom=1.6cm}

% ── Hyperlinks ───────────────────────────────────────────────────────────────
\hypersetup{
  colorlinks=true,
  linkcolor=accent,
  urlcolor=accent,
  urlbordercolor=accentmid,
  linkbordercolor=accentmid,
  pdfborderstyle={round}{0}{1},
}

% ── Microtype ─────────────────────────────────────────────────────────────────
\microtypesetup{protrusion=true,expansion=true,tracking=mtc}
% xelatex incompatible with expansion/tracking — override
\@ifpackageloaded{iftex}{
  \ifXeTeX\microtypesetup{expansion=false,tracking=false}\fi
}{}

% ── Section titles: left accent bar + subtle background pill ────────────────
\titleformat{\section}{%
  \normalsize\sffamily\bfseries\color{primary}\raggedright
}{%
  \llap{\color{accent}\rule[0.15ex]{3pt}{1.05em}\hspace{0.35em}}% left accent bar
}{0em}{}
\titlespacing*{\section}{0pt}{2.2ex}{0.6ex}

% ── Itemize: compact with accent bullets ─────────────────────────────────────
\setlist{noitemsep,topsep=0.08ex,partopsep=0pt,parsep=0pt}
\setlist[itemize]{%
  leftmargin=0.85em,
  label=\color{accent}\textbullet,
  itemsep=0.07cm,
  parsep=0pt,
}

% ── Page top accent bar ───────────────────────────────────────────────────────
\AtBeginDocument{%
  \AddToShipoutPictureFG{%
    \put(0,\dimexpr\paperheight-\topmargin-1in-5pt\relax){%
      \textcolor{headerbar}{\rule{\paperwidth}{4.5pt}}%
    }%
  }%
}

% ── Single refined rule divider ───────────────────────────────────────────────
\newcommand{\headerrule}{%
  \par\noindent\textcolor{accentmid}{\rule{\linewidth}{1.2pt}}\par
  \nopagebreak\vspace{0.25cm}%
}

% ── Footer: page number + name ───────────────────────────────────────────────
\fancypagestyle{plain}{%
  \fancyfoot[L]{\sffamily\scriptsize\color{muted}Yuanshuo Du}
  \fancyfoot[C]{\sffamily\scriptsize\color{muted}\thepage}
  \fancyfoot[R]{}
  \fancyfoot[RO]{\color{rule}\rule{\linewidth}{0.4pt}}%
  \fancyfoot[LE]{\color{rule}\rule{\linewidth}{0.4pt}}
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{plain}

% ── Compact entry helper ─────────────────────────────────────────────────────
% Usage: \entry{Title}{Company}{Date}{Description}
\newcommand{\entry}[4]{%
  \textbf{#1}
  \hfill {\sffamily\scshape\small\color{secondary}#3}\\
  {\itshape\color{secondary}#2}%
  \vspace{-0.7mm}%
  \begin{itemize}
    #4
  \end{itemize}
  \vspace{0.12cm}
}

\endinput
