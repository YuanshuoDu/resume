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
\RequirePackage{lmodern}
\RequirePackage{textcomp}

% ── Refined professional color palette ────────────────────────────────────────
% Deep navy primary for strong hierarchy; vibrant blue accent for modern feel
\definecolor{primary}{RGB}{15,23,42}       % Slate-900 — headings, name
\definecolor{accent}{RGB}{37,99,235}       % Blue-600 — bullets, links, accent bars
\definecolor{accentlight}{RGB}{219,234,254} % Blue-100 — soft skill pill background
\definecolor{accentmid}{RGB}{147,197,253}  % Blue-300 — divider accent
\definecolor{secondary}{RGB}{51,65,85}     % Slate-700 — company names, meta
\definecolor{muted}{RGB}{100,116,139}      % Slate-500 — dates, secondary labels
\definecolor{rule}{RGB}{226,232,240}       % Slate-200 — light dividers
\definecolor{headerbar}{RGB}{37,99,235}    % Blue-600 — top page bar
\definecolor{surface}{RGB}{248,250,252}    % Slate-50 — project tech pill bg
\definecolor{surface2}{RGB}{241,245,249}   % Slate-100 — section alt bg (unused)
\definecolor{skillbg}{RGB}{239,246,255}    % Blue-50 — skills pill bg
\definecolor{skilltext}{RGB}{29,78,216}   % Blue-700 — skills pill text

% ── Page geometry ────────────────────────────────────────────────────────────
\geometry{a4paper,left=2cm,top=1.7cm,right=2cm,bottom=1.7cm}

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
\@ifpackageloaded{iftex}{
  \ifXeTeX\microtypesetup{expansion=false,tracking=false}\fi
}{}

% ── Section titles: left accent bar + letter-spacing ────────────────────────
\titleformat{\section}{%
  \normalsize\sffamily\bfseries\color{primary}\raggedright
  \addtolength{\spaceskip}{0.08em}% slightly increased letter spacing
}{%
  \llap{\color{accent}\rule[0.12ex]{3pt}{1.1em}\hspace{0.38em}}% left accent bar, refined
}{0em}{}
\titlespacing*{\section}{0pt}{2.8ex}{0.7ex}% more breathing room above/below sections

% ── Itemize: compact with accent bullets ─────────────────────────────────────
\setlist{noitemsep,topsep=0.1ex,partopsep=0pt,parsep=0pt}
\setlist[itemize]{%
  leftmargin=0.9em,
  label=\color{accent}\textbullet,
  itemsep=0.08cm,
  parsep=0pt,
}

% ── Page top accent bar ───────────────────────────────────────────────────────
\AtBeginDocument{%
  \AddToShipoutPictureFG{%
    \put(0,\dimexpr\paperheight-\topmargin-1in-6pt\relax){%
      \textcolor{headerbar}{\rule{\paperwidth}{5pt}}%
    }%
  }%
}

% ── Refined rule divider ───────────────────────────────────────────────────────
\newcommand{\headerrule}{%
  \par\noindent\textcolor{accentmid}{\rule{\linewidth}{1.5pt}}\par
  \nopagebreak\vspace{0.3cm}%
}

% ── Footer: page number + name ───────────────────────────────────────────────
\fancypagestyle{plain}{%
  \fancyfoot[L]{\sffamily\scriptsize\color{muted}Yuanshuo Du}
  \fancyfoot[C]{\sffamily\scriptsize\color{muted}\thepage}
  \fancyfoot[R]{}
  \fancyfoot[RO]{\color{rule}\rule{\linewidth}{0.4pt}}%
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{plain}

% ── Compact entry helper ─────────────────────────────────────────────────────
\newcommand{\entry}[4]{%
  \textbf{#1}
  \hfill {\sffamily\scshape\small\color{secondary}#3}\\
  {\itshape\color{secondary}#2}%
  \vspace{-0.7mm}%
  \begin{itemize}
    #4
  \end{itemize}
  \vspace{0.14cm}
}

% ── Skill pill: softer rounded box ──────────────────────────────────────────
% Uses \rmfamily to ensure consistent baseline, avoids \colorbox harshness
\RequirePackage{calc}
\def\skillpill#1{%
  {\rmfamily\small\color{skilltext}%
    \kern0.06em\relax%
    \setlength{\fboxrule}{0pt}%
    \setlength{\fboxsep}{0.35em}%
    \raisebox{0.22ex}{%
      \colorbox{skillbg}{\kern0.06em\relax#1\kern0.06em\relax}%
    }%
    \kern0.06em\relax
  }%
}

\endinput
