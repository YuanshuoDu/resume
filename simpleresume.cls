\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpleresume}[2024]

\LoadClass{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{eso-pic}
\RequirePackage{array}
\RequirePackage{fancyhdr}
\RequirePackage{ragged2e}
\RequirePackage{textcomp}
\RequirePackage{calc}
\RequirePackage{sourcesanspro}
\@ifpackageloaded{iftex}{%
  \ifXeTeX
    \RequirePackage{microtype}
    \microtypesetup{expansion=false,tracking=false}%
  \fi
}{}

% ── Professional color palette ────────────────────────────────────────────────
\definecolor{primary}{RGB}{15,23,42}       % Slate-900 — headings
\definecolor{accent}{RGB}{37,99,235}       % Blue-600 — bullets, links, accent bars
\definecolor{accentmid}{RGB}{147,197,253}  % Blue-300 — divider accent
\definecolor{secondary}{RGB}{51,65,85}     % Slate-700 — company names, meta
\definecolor{muted}{RGB}{71,85,105}       % Slate-600 — dates, secondary labels (~4.7:1 on white, passes WCAG AA)
\definecolor{rule}{RGB}{226,232,240}       % Slate-200 — light dividers
\definecolor{headerbar}{RGB}{37,99,235}    % Blue-600 — top page bar
\definecolor{headerbar2}{RGB}{99,179,237}  % Blue-400 — subtle gradient strip
\definecolor{namecolor}{RGB}{15,23,42}    % Slate-900 — name
\definecolor{skillbg}{RGB}{239,246,255}    % Blue-50 — skills pill bg
\definecolor{skilltext}{RGB}{29,78,216}   % Blue-700 — skills pill text

% ── Page geometry ────────────────────────────────────────────────────────────
\geometry{a4paper,left=1.7cm,top=1.2cm,right=1.7cm,bottom=1.5cm}

% ── Hyperlinks ───────────────────────────────────────────────────────────────
\hypersetup{
  colorlinks=true,
  linkcolor=accent,
  urlcolor=accent,
  urlbordercolor=accentmid,
  linkbordercolor=accentmid,
}

% ── Section titles: left accent bar ─────────────────────────────────────────
\titleformat{\section}{%
  \normalsize\sffamily\bfseries\color{primary}%
  \addtolength{\spaceskip}{0.08em}%
  \raggedright
}{%
  \llap{\color{accent}\rule[0.12ex]{3pt}{1.05em}\hspace{0.38em}}% left accent bar
}{0em}{}
\titlespacing*{\section}{0pt}{0.8ex}{0.28ex}

% ── Itemize: compact with accent bullets ─────────────────────────────────────
\setlist{noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt}
\setlist[itemize]{%
  leftmargin=1.25em,
  label=\color{accent}\textbullet,
  itemsep=0.06cm,
  parsep=0.03cm,
}

% ── Page top accent bar with subtle gradient strip ───────────────────────────
\AtBeginDocument{%
  \AddToShipoutPictureFG{%
    \put(0,\dimexpr\paperheight-\topmargin-1in-8pt\relax){%
      \textcolor{headerbar}{\rule{\paperwidth}{3pt}}%
    }%
    \put(0,\dimexpr\paperheight-\topmargin-1in-8pt-2pt\relax){%
      \textcolor{headerbar2}{\rule{\paperwidth}{1pt}}%
    }%
  }%
}

% ── Header rule divider ───────────────────────────────────────────────────────
\newcommand{\headerrule}{%
  \par\noindent\textcolor{accentmid}{\rule{\linewidth}{1.5pt}}\par
  \nopagebreak\vspace{0.25cm}%
}

% ── Footer ───────────────────────────────────────────────────────────────────
\fancypagestyle{plain}{%
  \fancyhead{}% Clear all headers (prevents section names appearing at top)
  \fancyfoot[L]{\sffamily\scriptsize\color{secondary}Yuanshuo Du}
  \fancyfoot[C]{\sffamily\scriptsize\color{muted}\thepage}
  \fancyfoot[R]{\color{rule}\rule{0.4pt}{6pt}}
  \fancyfoot[RO]{\color{rule}\rule{\linewidth}{0.4pt}}%
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{plain}

% ── Skill pill ────────────────────────────────────────────────────────────────
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
