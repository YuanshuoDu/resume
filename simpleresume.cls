\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpleresume}[2024]

\LoadClass{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}

% ── Professional color palette ───────────────────────────────────────────────
% Based on "Tech Blue" palette — deep navy primary, vivid blue accent
\definecolor{primary}{RGB}{15,23,42}       % Deep navy — name, section headings
\definecolor{accent}{RGB}{37,99,235}      % Vivid blue — bullets, underline, top bar
\definecolor{accentlight}{RGB}{147,197,253} % Blue-300 — subtle tints
\definecolor{secondary}{RGB}{71,85,105}    % Slate-600 — company names, meta
\definecolor{muted}{RGB}{100,116,139}     % Slate-500 — muted / date labels
\definecolor{rule}{RGB}{203,213,225}       % Slate-300 — divider lines
\definecolor{headerbar}{RGB}{37,99,235}    % Same accent — top page bar

% ── Page geometry ────────────────────────────────────────────────────────────
\geometry{a4paper,left=2.2cm,top=1.8cm,right=2.2cm,bottom=1.8cm}

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
  \large\sffamily\bfseries\color{primary}%
}{%
  \llap{\color{accent}\rule[0.18ex]{3pt}{1.05em}\hspace{0.38em}}% left accent bar
}{0em}{}
\titlespacing*{\section}{0pt}{2.1ex}{0.55ex}

% ── Itemize: accent-colored bullets ──────────────────────────────────────────
\setlist{noitemsep,topsep=0.12ex,partopsep=0pt}
\setlist[itemize]{leftmargin=0.95em,label=\color{accent}\textbullet}

% ── Page top accent bar ───────────────────────────────────────────────────────
\AtBeginDocument{%
  \AddToShipoutPictureFG{%
    \put(0,\dimexpr\paperheight-\topmargin-1in-5pt\relax){%
      \textcolor{headerbar}{\rule{\paperwidth}{5pt}}%
    }%
  }%
}

% ── Double-rule header divider (thin rule + accent rule) ─────────────────────
\newcommand{\headerrule}{%
  \par\noindent\textcolor{rule}{\rule{\linewidth}{0.7pt}}\par
  \nopagebreak\vspace{-0.55ex}%
  \par\noindent\textcolor{accent}{\rule{\linewidth}{1.6pt}}\par
  \nopagebreak\vspace{0.32cm}%
}

% ── Footer ───────────────────────────────────────────────────────────────────
\fancypagestyle{plain}{%
  \fancyfoot[C]{\sffamily\scriptsize\color{muted}\thepage}
  \fancyfoot[L,R]{}
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{plain}

\endinput
