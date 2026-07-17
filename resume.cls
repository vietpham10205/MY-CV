%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resume Class File — upgraded for modern look
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2024/01/01 v1.1 Resume class]

\LoadClass[12pt,a4paper]{article}

% ---------- packages ----------
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\usepackage[T1]{fontenc}
\usepackage{lmodern}           % cleaner Latin Modern font
\usepackage{microtype}         % better text justification
\usepackage{xcolor}
\usepackage{hyperref}

% ---------- colour palette ----------
\definecolor{headerblue}{RGB}{26,54,93}    % dark navy for name
\definecolor{accentblue}{RGB}{37,99,235}   % blue for links & rules
\definecolor{rulegray}{RGB}{160,160,165}   % subtle section rule

\hypersetup{
  colorlinks=true,
  urlcolor=accentblue,
  linkcolor=accentblue,
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
%  HEADING COMMANDS
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}}
\def \@name {}

\def \addressSep {\ \textbullet\ }

\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \@ifundefined{@addressthree}{
      \def \@addressthree {#1}
    }{
      \def \@addressone {#1}
    }}
}

\def \printaddress #1{
  \begingroup
  \def \\ {\addressSep}
  \centerline{\small\color{black!70}#1}
  \endgroup
  \par
  \addressskip
}

\def \printname {
  \begingroup
  \hfil{{\namesize\bfseries\color{headerblue}\@name}}\hfil
  \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%  PRINT HEADER
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printname
  \@ifundefined{@addressone}{}{\printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}
  \vspace{2pt}
  {\color{accentblue}\hrule height 1.2pt}
  \vspace{4pt}
}

%----------------------------------------------------------------------------------------
%  SECTION FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSection}[1]{
  \sectionskip
  {\color{headerblue}\textbf{\MakeUppercase{#1}}}
  \sectionlineskip
  {\color{rulegray}\hrule height 0.6pt}
  \vspace{2pt}
  \begin{list}{}{
    \setlength{\leftmargin}{0em}
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%  WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{
  {\bf #1} \hfill {#2}
  \ifthenelse{\equal{#3}{}}{}{
    \\
    {\em #3} \hfill {\em #4}
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em}
  \itemsep -0.5em \vspace{-0.5em}
}{
  \end{list}
  \vspace{0.5em}
}

%----------------------------------------------------------------------------------------
%  SPACING
%----------------------------------------------------------------------------------------

\def\namesize{\Large}
\def\addressskip{\smallskip}
\def\sectionlineskip{\smallskip}
\def\nameskip{\smallskip}
\def\sectionskip{\medskip}
