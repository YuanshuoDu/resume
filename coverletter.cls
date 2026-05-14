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
\definecolor{accentmid}{RGB}{59,130,246}   % Blue-500 — divider accent (WCAG AA on white)
\definecolor{secondary}{RGB}{51,65,85}     % Slate-700 — body text
\definecolor{muted}{RGB}{100,116,139}      % Slate-500 — dates, meta
\definecolor{rule}{RGB}{226,232,240}       % Slate-200 — dividers
\definecolor{headerbar}{RGB}{37,99,235}    % Blue-600 — top bar
\definecolor{headerbar2}{RGB}{99,179,237}  % Blue-400 — gradient strip
\definecolor{namecolor}{RGB}{15,23,42}    % Slate-900 — name

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

% ── Page top accent bar with subtle gradient strip ───────────────────────────
\AtBeginDocument{%
  \AddToShipoutPictureFG{%
    \put(0,\dimexpr\paperheight-\topmargin-1in-8pt){%
      \textcolor{headerbar}{\rule{\paperwidth}{2pt}}}%
    \put(0,\dimexpr\paperheight-\topmargin-1in-8pt-2pt){%
      \textcolor{headerbar2}{\rule{\paperwidth}{0.5pt}}}%
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
  \par\noindent\textcolor{accentmid}{\rule{\linewidth}{1.5pt}}\par
  \nopagebreak\vspace{0.2cm}%
}

% ── Skill pill (muted — cover-letter appropriate) ─────────────────────────────
% Muted from resume-style vivid blue to slate for a more editorial feel
\def\skillpill#1{%
  {{\rmfamily\small\color{secondary}%
    \kern0.06em\relax%
    \setlength{\fboxrule}{0pt}%
    \setlength{\fboxsep}{0.35em}%
    \raisebox{0.22ex}{%
      \colorbox{muted!15}{\kern0.06em\relax#1\kern0.06em\relax}%
    }%
    \kern0.06em\relax
  }}%
}

% ── Contact icon shortcut (text-based, no external font needed) ─────────────
% Uses small coloured text labels instead of icon fonts for reliability
\def\cllabel#1{{\sffamily\small\color{accent}\textbf{#1}}\ }

\endinput
