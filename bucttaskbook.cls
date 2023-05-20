\ifbuct@bachelor
    \newenvironment{taskbook}{%
        \cleardoublepage%
        \buct@pdfmark{\buct@task@pdf}{taskbook}%
        \section*{\buct@task@title}%
    }{\clearpage}
    \NewDocumentCommand{\buct@ul}{ o m }{\underline{\makebox[#1][c]{#2}}}
    \NewDocumentCommand\taskinfo{ s }{%
        \noindent%
        \begin{minipage}{\textwidth}%
            \punctstyle{plain}\linespread{1.94}%
                \buct@task@ctitle\buct@ul[27em]{\buct@ctitle}\\[3pt]
            \IfBooleanTF{#1}{% less lines break
                \buct@task@school\buct@ul[10em]{\buct@school}\quad
                \buct@task@major\buct@ul[10em]{\buct@major}\quad
                \buct@task@class\buct@ul[5em]{\buct@class}\\[3pt]
                \buct@task@student\buct@ul[5em]{\buct@cauthor}\quad
                \buct@task@supervisor\buct@ul[6em]{\buct@supervisor}\quad
                \buct@task@msupervisor\buct@ul[4em]{\buct@msupervisor}%
            }{% more lines break
                \buct@task@school\buct@ul[15em]{\buct@school}\qquad
                \buct@task@major\buct@ul[13em]{\buct@major}\\[3pt]
                \buct@task@class\buct@ul[15em]{\buct@class}\qquad
                \buct@task@student\buct@ul[13em]{\buct@cauthor}\\[3pt]
                \buct@task@supervisor\buct@ul[8em]{\buct@supervisor}\qquad
                \buct@task@msupervisor\buct@ul[10em]{\buct@msupervisor}%
            }
        \end{minipage}\vspace{1.5em}
    }
    \newcounter{taskitemcnt}
    \newcommand{\buct@taskitem}{%
        \stepcounter{taskitemcnt}%
        \ifcase\value{taskitemcnt}\relax\or%
        {\buct@task@itema}\or%
        {\buct@task@itemb}\or%
        {\buct@task@itemc}\or%
        {\buct@task@itemd}\else%
        \ClassError{buctthesis}{Too many \protect\taskitem\space used}%
        {Keep \protect\taskitem\space no more than 4 times.}\fi
    }
    \newcommand{\taskitem}{\vspace{6pt}\noindent\buct@taskitem\par}
\fi
