\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coverletter}[2024]

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

% ── Professional color palette (WCAG AA compliant) ──────────────────────────
\definecolor{primary}{RGB}{15,23,42}       % Slate-900 — headings (~19:1 on white)
\definecolor{accent}{RGB}{29,78,216}       % Blue-700 — bullets, links, accent (~7.2:1 on white, WCAG AA)
\definecolor{accentmid}{RGB}{147,197,253}  % Blue-300 — subtle accents
\definecolor{secondary}{RGB}{51,65,85}     % Slate-700 — body text (~7:1 on white, WCAG AA)
\definecolor{muted}{RGB}{71,85,105}       % Slate-600 — secondary meta (~4.8:1 on white, WCAG AA)
\definecolor{rule}{RGB}{226,232,240}       % Slate-200 — dividers
\definecolor{namecolor}{RGB}{15,23,42}    % Slate-900 — name
\definecolor{skillbg}{RGB}{239,246,255}    % Blue-50 — pill bg
\definecolor{skilltext}{RGB}{29,78,216}   % Blue-700 — pill text
\definecolor{taglinebg}{RGB}{239,246,255} % Blue-50 — tagline block bg

% ── Page geometry ────────────────────────────────────────────────────────────
\geometry{a4paper,left=1.8cm,top=1.4cm,right=1.8cm,bottom=1.6cm}

% ── Hyperlinks ───────────────────────────────────────────────────────────────
\hypersetup{
  colorlinks=true,
  linkcolor=accent,
  urlcolor=accent,
  urlbordercolor=accentmid,
  linkbordercolor=accentmid,
}

% ── Letter rule divider ──────────────────────────────────────────────────────
\newcommand{\clrule}{%
  \par\noindent\textcolor{accentmid}{\rule{\linewidth}{1.5pt}}\par
  \nopagebreak\vspace{0.25cm}%
}

% ── Footer ────────────────────────────────────────────────────────────────────
\fancypagestyle{plain}{%
  \fancyhead{}%
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
