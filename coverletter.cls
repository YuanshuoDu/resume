\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coverletter}[2024 Stylish Cover Letter]

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

% ── Color palette (matches simpleresume.cls) ─────────────────────────────────
\definecolor{primary}{RGB}{15,23,42}       % Slate-900 — headings
\definecolor{accent}{RGB}{37,99,235}       % Blue-600 — accent bars, links
\definecolor{accentmid}{RGB}{147,197,253}  % Blue-300 — divider accent
\definecolor{secondary}{RGB}{51,65,85}     % Slate-700 — body text
\definecolor{muted}{RGB}{71,85,105}        % Slate-600 — dates, meta (darkened)
\definecolor{rule}{RGB}{200,210,220}       % Slate-300 — dividers (darkened)
\definecolor{headerbar}{RGB}{37,99,235}    % Blue-600 — top bar
\definecolor{namecolor}{RGB}{15,23,42}    % Slate-900 — name
\definecolor{skillbg}{RGB}{219,234,254}    % Blue-100 — skills pill bg (visible on white)
\definecolor{skilltext}{RGB}{29,78,216}   % Blue-700 — skills pill text (high contrast)

% ── Page geometry ────────────────────────────────────────────────────────────
\geometry{a4paper,left=1.7cm,top=1.2cm,right=1.7cm,bottom=1.2cm}

% ── Hyperlinks ───────────────────────────────────────────────────────────────
\hypersetup{
  colorlinks=true,
  linkcolor=accent,
  urlcolor=accent,
  urlbordercolor=accentmid,
  linkbordercolor=accentmid,
}

% ── Page top accent bar — single slim bar ───────────────────────────────────
\AtBeginDocument{%
  \AddToShipoutPictureFG{%
    \put(0,\dimexpr\paperheight-\topmargin-1in-7pt\relax){%
      \textcolor{headerbar}{\rule{\paperwidth}{2pt}}}%
  }%
}

% ── Section title style (subtle left bar) ────────────────────────────────────
\titleformat{\section}{%
  \normalsize\sffamily\bfseries\color{primary}%
  \addtolength{\spaceskip}{0.08em}%
  \raggedright
}{%
  \llap{\color{accent}\rule[0.12ex]{3pt}{1em}\hspace{0.35em}}% left accent bar
}{0em}{}
\titlespacing*{\section}{0pt}{0.7ex}{0.2ex}

% ── Footer ───────────────────────────────────────────────────────────────────
\fancypagestyle{plain}{%
  \fancyfoot[L]{\sffamily\scriptsize\color{secondary}Yuanshuo Du}
  \fancyfoot[C]{\sffamily\scriptsize\color{muted}\thepage}
  \fancyfoot[R]{\color{rule}\rule{0.4pt}{6pt}}
  \fancyfoot[RO]{\color{rule}\rule{\linewidth}{0.4pt}}%
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{plain}

% ── Accent rule helper ────────────────────────────────────────────────────────
\newcommand{\clrule}{%
  \par\noindent\textcolor{accentmid}{\rule{\linewidth}{2pt}}\par
  \nopagebreak\vspace{0.2cm}%
}

% ── Skill pill (blue pill matching resume style — high contrast for ATS) ──────
\def\skillpill#1{%
  {{\rmfamily\small\color{skilltext}%
    \kern0.06em\relax%
    \setlength{\fboxrule}{0pt}%
    \setlength{\fboxsep}{0.35em}%
    \raisebox{0.22ex}{%
      \colorbox{skillbg}{\kern0.06em\relax#1\kern0.06em\relax}%
    }%
    \kern0.06em\relax
  }}%
}

% ── Contact icon shortcut (text-based, no external font needed) ─────────────
\def\cllabel#1{{\sffamily\small\color{accent}\textbf{#1}}\ }
