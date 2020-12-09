%%
%% This is file `buctthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% buctthesis.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2019-2020 by Miracle0565
%% 
%%     https://github.com/Miracle0565/BUCTthesis
%% 
%% This file may be distributed and/or modified under
%% the conditions of the LaTeX Project Public License,
%% either version 1.3c of this license or (at your option)
%% any later version. The latest version of this license
%% is in:
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions
%% of LaTeX version 1999/12/01 or later.
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{buctthesis}[2020/12/10 Beta.v0.9.6 BUCT Thesis Template]
\RequirePackage{ifxetex}
\RequireXeTeX
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family   = buct,
    prefix   = buct@,
    setkeys  = \kvsetkeys,
}
\DeclareBoolOption{submit}
\DeclareBoolOption{openany}
\DeclareComplementaryOption{openright}{openany}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\PassOptionsToPackage{quiet}{xeCJK}
\ifbuct@openany\LoadClass[zihao=-4,UTF8,oneside]{ctexbook}
\else\LoadClass[zihao=-4,UTF8,openright]{ctexbook}\fi
\newcommand{\buct@def@key}[1]{
    \@namedef{#1}##1{\@namedef{buct@#1}{##1}}
    \define@key{buct}{#1}{\@nameuse{#1}{##1}}
}
\newcommand{\buctsetup}[1]{\kvsetkeys{buct}{#1}}
\buct@def@key{ctitle}
\buct@def@key{etitle}
\buct@def@key{cauthor}
\buct@def@key{class}
\buct@def@key{studentid}
\buct@def@key{school}
\buct@def@key{major}
\buct@def@key{supervisor}
\buct@def@key{msupervisor}
\newcommand{\buct@def@sep@key}[2]{%
    \@namedef{#1}##1{%
        \@namedef{buct@#1}{}%
        \@for\reserved@a:=##1\do{
            \expandafter\ifx\csname buct@#1\endcsname\@empty\else
            \expandafter\g@addto@macro\csname buct@#1\endcsname{#2}\fi
            \expandafter\expandafter\expandafter\g@addto@macro%
            \expandafter\csname buct@#1\expandafter\endcsname%
            \expandafter{\reserved@a}
        }
    }
    \define@key{buct}{#1}{\@nameuse{#1}{##1}}%
}
\buct@def@sep@key{ckeywords}{\quad}
\buct@def@sep@key{ekeywords}{; }
\RequirePackage{geometry,fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{amsmath,amsthm,amssymb,unicode-math}
\RequirePackage{pifont,enumitem}
\RequirePackage{siunitx}
\RequirePackage[version = 4]{mhchem}
\RequirePackage{float}
\RequirePackage{longtable,threeparttable,tabularx,multirow,booktabs}
\RequirePackage{graphicx}
\RequirePackage[labelformat = simple]{subcaption}
\RequirePackage[format=hang]{caption}
\RequirePackage{tikz}
\RequirePackage{listings}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage{xcolor}
\RequirePackage{pdfpages}
\RequirePackage[bottom,perpage]{footmisc}
\RequirePackage{xpatch}
\RequirePackage{hyperref}
\xeCJKsetup{EmboldenFactor=2.2,SlantFactor=0.2}
\setCJKmainfont{SimSun}[AutoFakeBold,AutoFakeSlant]
\setCJKsansfont{SimHei}[AutoFakeBold]
\newcommand{\bfsong}{\bfseries}
\newcommand{\bfhei}{\sffamily\bfseries}
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Times New Roman}
\IfFontExistsTF{LibertinusMath-Regular.otf}{%
    \setmathfont{latinmodern-math.otf}
    \setmathfont[%
        range = {%
            up/{latin,Latin,num},
            it/{latin,Latin,greek},
            bfit/{latin,Latin},
        }
    ]{LibertinusMath-Regular.otf}
}{}
\newcommand{\buct@headfont}{\zihao{-5}\songti}
\newcommand{\buct@footfont}{\zihao{-5}\songti}
\newcommand{\buct@abstitfont}{\zihao{3}\bfsong}
\newcommand{\buct@abs@infofont}{\zihao{5}\songti}
\newcommand{\buct@absabsfont}{\zihao{4}\songti}
\newcommand{\buct@keywordsfont}{\zihao{4}\heiti}
\newcommand{\buct@abstitfonten}{\zihao{3}\bfseries}
\newcommand{\buct@absabsfonten}{\zihao{4}\songti}
\newcommand{\buct@keywordsfonten}{\zihao{4}\heiti\CJKfamily+{}}
\newcommand{\buct@toc@tocfont}{\zihao{4}\mdseries\heiti}
\newcommand{\buct@toc@chapfont}{\zihao{4}\heiti}
\newcommand{\buct@toc@secfont}{\zihao{4}\songti}
\newcommand{\buct@toc@ssecfont}{\zihao{4}\songti}
\newcommand{\buct@toc@dsgfigfont}{\buct@toc@ssecfont}
\newcommand{\buct@chapfont}{\zihao{-3}\bfsong\centering}
\newcommand{\buct@secfont}{\zihao{-3}\bfsong\centering}
\newcommand{\buct@ssecfont}{\zihao{-4}\bfsong\raggedright}
\newcommand{\buct@sssecfont}{\zihao{-4}\songti}
\newcommand{\buct@floatfont}{\zihao{5}\songti}
\newcommand{\buct@codefont}{\ttfamily\songti\zihao{5}}
\newcommand{\buct@codecomfont}{%
    \ttfamily\slshape
    \ifbuct@submit\relax\else\color{gray!80!black}\fi}
\newcommand{\buct@codekeyfont}{%
    \ttfamily\bfseries
    \ifbuct@submit\relax\else\color{blue!80!black}\fi}
\geometry{%
    a4paper,nomarginpar,
    top=3.5cm, bottom=2.6cm, left=2.7cm, right=2.7cm,
    headheight=1.1cm, footskip=0.6cm,
}
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[C]{\buct@footfont\thepage}
    \fancyhead[C]{\buct@headfont{北京化工大学毕业设计（论文）}}
    \renewcommand\headrulewidth{0.6pt}
    \renewcommand\footrulewidth{0pt}
}
\pagestyle{plain}
\xpatchcmd{\frontmatter}
    {\pagenumbering{roman}}
    {\pagenumbering{Roman}}
    {}{}
\xpatchcmd{\cleardoublepage}
    {\newpage}
    {\thispagestyle{empty}\newpage}
    {}{}
\newcommand{\buct@pdfmark}[2]{%
    \hypertarget{#2}{}
    \pdfbookmark{#1}{#2}
}
\newcommand{\buct@declare@content}{
    所呈交的学位论文是本人在导师的指导下独立进行研究工作所取得的成果。
    据我所知，除文中已经注明引用的内容外，本论文不包含任何其他个人或集体
    已经发表或撰写过的研究成果，也不包含为获得北京化工大学或其它教育机构
    的学位或证书而使用过的材料。对论文所涉及的研究工作做出贡献的其他个人
    和集体，均已在文中以明确方式标明或致谢。本人完全意识到本声明的法律
    结果由本人承担。
}
\newcommand{\buct@makedeclare}{
    \setlength{\baselineskip}{2em}%
    \centerline{\songti\zihao{3} 诚信声明}\par\vspace{1em}
    \leftline{\songti\zihao{4}\noindent 本人声明：}%
    \buct@declare@content
    \par\vspace{2em}\hfill{本人签名：\hspace{14em}年\hspace{2.5em}月\hspace{2.5em}日}\clearpage
}
\NewDocumentCommand{\makedeclare}{ o }{%
    \buct@pdfmark{诚信声明}{declare}
    \IfNoValueTF{#1}{\buct@makedeclare}{%
        \includepdf[pages=-]{#1}
    }
}
\newenvironment{taskbook}{%
    \cleardoublepage%
    \buct@pdfmark{任务书}{taskbook}%
    \section*{本科生毕业设计（论文）任务书}%
}{\clearpage}
\NewDocumentCommand{\buct@ul}{ o m }{\underline{\makebox[#1][c]{#2}}}
\NewDocumentCommand\taskinfo{ s }{%
    \noindent%
    \begin{minipage}{\textwidth}%
        \punctstyle{plain}\linespread{1.94}\selectfont%
            设计（论文）题目：\buct@ul[27em]{\buct@ctitle}\\[3pt]
        \IfBooleanTF{#1}{% less lines break
            学院：\buct@ul[10em]{\buct@school}\quad
            专业：\buct@ul[10em]{\buct@major}\quad
            班级：\buct@ul[5em]{\buct@class}\\[3pt]
            学生：\buct@ul[5em]{\buct@cauthor}\quad
            指导教师（含职称）：\buct@ul[6em]{\buct@supervisor}\quad
            专业负责人：\buct@ul[4em]{\buct@msupervisor}%
        }{% more lines break
            学院：\buct@ul[15em]{\buct@school}\qquad
            专业：\buct@ul[13em]{\buct@major}\\[3pt]
            班级：\buct@ul[15em]{\buct@class}\qquad
            学生：\buct@ul[13em]{\buct@cauthor}\\[3pt]
            指导教师（含职称）：\buct@ul[8em]{\buct@supervisor}\qquad
            专业负责人：\buct@ul[10em]{\buct@msupervisor}%
        }
    \end{minipage}\vspace{1.5em}
}
\newcounter{taskitemcnt}
\newcommand{\buct@taskitem}{%
    \stepcounter{taskitemcnt}%
    \ifcase\value{taskitemcnt}\relax\or%
    {1.设计（论文）的主要任务及目标}\or%
    {2.设计（论文）的基本要求和内容}\or%
    {3.主要参考文献}\or%
    {4.进度安排}\else%
    \ClassError{buctthesis}{Too many \protect\taskitem\space used}%
    {Keep \protect\taskitem\space no more than 4 times.}\fi
}
\newcommand{\taskitem}{\vspace{1em}\noindent\buct@taskitem\par}
\newenvironment{bibenumerate}{%
    \begin{enumerate}[label={[\arabic*]},leftmargin=3em]
}{\end{enumerate}}
\newenvironment{cabstract}{%
    \cleardoublepage
    \buct@pdfmark{摘要}{abstract}
    \centerline{\buct@abstitfont\buct@ctitle}\vspace{22pt}%
    \centerline{\buct@abs@infofont\buct@cauthor\quad\buct@class\quad\buct@studentid\quad{指导教师：}\buct@supervisor}\vspace{22pt}
    \centerline{\buct@absabsfont{摘要}}\vspace{22pt}%
}{\par\vspace{1em}\noindent\buct@keywordsfont 关键词：\buct@ckeywords}
\newenvironment{eabstract}{%
    \clearpage%
    \buct@pdfmark{Abstract}{abstracten}
    \centerline{\buct@abstitfonten{\buct@etitle}}\vspace{22pt}%
    \centerline{\buct@absabsfonten{ABSTRACT}}\vspace{22pt}%
}{\par\vspace{1em}\noindent\buct@keywordsfonten Keywords:~\buct@ekeywords}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
    \cleardoublepage
    \pdfbookmark{\contentsname}{toc}%
    \chapter*{\buct@toc@tocfont{目\quad 录}}%
    \@starttoc{toc}
}
\titlecontents{chapter}[0em]
    {\buct@toc@chapfont\vspace{3pt}}
    {\thecontentslabel\hspace{8pt}}{}
    {\hspace{.5ex}\titlerule*[3pt]{$\cdot$}\hspace{-.5ex}\bfseries\contentspage}
\titlecontents{section}[1.5em]
    {\buct@toc@secfont\vspace{-3pt}}
    {\thecontentslabel\hspace{8pt}}{}
    {\hspace{.5ex}\titlerule*[5pt]{$\cdot$}\hspace{.2ex}\contentspage}
\titlecontents{subsection}[3em]
    {\buct@toc@ssecfont\vspace{-3pt}}
    {\thecontentslabel\hspace{8pt}}{}
    {\hspace{.5ex}\titlerule*[7pt]{$\cdot$}\hspace{-.2ex}\contentspage}
\renewcommand{\bibsection}{\chapter*{\bibname}\addcontentsline{toc}{chapter}{\bibname}}
\newcommand{\dcaption}[1]{%
    \caption{#1}\addcontentsline{toc}{subsection}{%
        \hspace{2.5em}\dfigurename~\thefigure\hspace{1em}{#1}%
    }
}
\newcommand{\buct@listof}[2]{%
    \xpatchcmd{\@dottedtocline}{\hbox{.}}{\hbox{$\cdot$}}{}{}
    \renewcommand{\@dotsep}{1.7}%
        \@ifundefined{ext@#1}{\float@error{#1}}{%
        \@namedef{l@#1}{\@dottedtocline{1}{0em}{2em}}
        \float@listhead{\buct@toc@tocfont{}#2}%
        \begingroup\setlength{\parskip}{\z@}%
        \buct@toc@dsgfigfont\@starttoc{\@nameuse{ext@#1}}%
        \endgroup%
    }
}
\newcommand{\listofdesignfigures}{%
    \cleardoublepage%
    \buct@pdfmark{\dfigurename{}目录}{dfigure}%
    \buct@listof{dfigure}{\dfigurename{}目录}
}
\newenvironment{foreword}{%
    \cleardoublepage
    \buct@pdfmark{前言}{foreword}
    \chapter*{前\quad 言}
}{}
\linespread{1.52}\selectfont
\ctexset{%
    chapter = {%
        name        = {第,章},
        number      = \arabic{chapter},
        format      = \buct@chapfont,
        beforeskip  = 12 pt,
        afterskip   = 32 pt,
        fixskip     = true,
        aftername   = \qquad,
    },
    section = {%
        name        = {第,节},
        format      = \buct@secfont,
        aftername   = \quad,
        beforeskip  = 29 pt,
        afterskip   = 32 pt,
        fixskip     = true,
    },
    subsection = {%
        format      = \buct@ssecfont,
        aftername   = \quad,
        beforeskip  = 3 pt,
        afterskip   = 3 pt,
    },
    subsubsection = {%
        name        = {(,)},
        format      = \buct@sssecfont,
        number      = \arabic{subsubsection},
        beforeskip  = 3pt,
        afterskip   = 3pt,
        aftername   = \hspace{0.5em},
        indent      = 0.5em,
    },
    figurename   = 图,
    tablename    = 表,
    bibname      = 参考文献,
}
\setlist{%
    leftmargin = 2em,
    nosep,
}
\setlist[enumerate,1]{%
    label    = \lower 0.1em\hbox{\large{\ding{\numexpr191+\value{enumi}}}},
    labelsep = 2pt,
}
\setlist[enumerate,2]{%
    labelsep = 6pt,
}
\setlist[description]{%
    labelsep = 1em,
}
\unimathsetup{
    math-style  = ISO,
    bold-style  = ISO,
    partial     = upright,
}
\let\mathbb\relax
\DeclareMathAlphabet{\mathbb}{U}{msb}{m}{n}%
\newtheoremstyle{buctthm}%    name
{3pt}%                        Space above
{3pt}%                        Space below
{}%                            Body font
{}%                            Indent amount
{\bfseries}%                Theorem head font
{:}%                        Punctuation after theorem head
{.5em}%                        Space after theorem head
{}%                            Theorem head spec
\theoremstyle{buctthm}
\newtheorem{axiom}{公理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{remark}{注解}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{property}{性质}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont\topsep6\p@\@plus6\p@\relax
    \trivlist
    \item\relax
    {#1\@addpunct{.}}\hspace\labelsep\ignorespaces
}{\popQED\endtrivlist\@endpefalse}
\sisetup{%
    list-final-separator = { 和 },
    list-pair-separator = { 和 },
    range-phrase = {$\sim$},
}
\newcommand{\dfigurename}{设计图纸}
\newfloat{dfigure}{htbp}{lodf}[chapter]
\floatname{dfigure}{\dfigurename}
\graphicspath{{figure/}}
\renewcommand{\captionfont}{\buct@floatfont}
\renewcommand{\captionlabelfont}{\buct@floatfont}
\DeclareCaptionLabelSeparator{capspace}{\quad}
\captionsetup{labelsep=capspace}
\captionsetup[table]{%
    position  = top,
    aboveskip = 0.5em,
    belowskip = 0.5em,
}
\captionsetup[figure]{%
    position  = bottom,
    aboveskip = 0.5em,
    belowskip = -0.5em,
}
\captionsetup[dfigure]{%
    position  = bottom,
    aboveskip = 1em,
    belowskip = 1em,
}
\AtBeginDocument{%
    \renewcommand{\thesubtable}{(\alph{subtable})}
    \renewcommand{\thetable}{\thechapter-\arabic{table}}
    \renewcommand{\thesubfigure}{(\alph{subfigure})}
    \renewcommand{\thefigure}{\thechapter-\arabic{figure}}
    \renewcommand{\theequation}{\thechapter-\arabic{equation}}
    \renewcommand{\thedfigure}{\thechapter-\arabic{dfigure}}
    \renewcommand{\thelstlisting}{\thechapter-\arabic{lstlisting}}
}
\lstset{%
    %lineskip = -3pt,
    aboveskip        = 0.5em,
    belowskip        = 0.5em,
    tabsize          = 4,
    basicstyle       = \buct@codefont,
    frame            = single,
    basewidth        = {.5em,.4em},
    xleftmargin      = 1.5em,
    xrightmargin     = 1.5em,
    commentstyle     = \buct@codecomfont,
    keywordstyle     = \buct@codekeyfont,
    backgroundcolor  = \color{lightgray!10},
    showtabs         = false,
    showspaces       = false,
    showstringspaces = false,
    captionpos       = t,
    breaklines       = true,
    numbers          = left,
    numberstyle      = \tiny,
    numbersep        = 6 pt,
    stepnumber       = 1,
    extendedchars    = false,
    escapechar       = {@*},
}
\renewcommand{\lstlistingname}{代码}
\newenvironment{conclusion}{%
    \chapter*{结\quad 论}
    \addcontentsline{toc}{chapter}{结论}
}{}
\newenvironment{translation}{%
    \chapter*{翻\quad 译}
    \addcontentsline{toc}{chapter}{翻译}
}{}
\newenvironment{acknowledgement}{%
    \chapter*{致\quad 谢}
    \addcontentsline{toc}{chapter}{致谢}
}{}
\NewDocumentEnvironment{denotation}{ O{10em} +b }{%
    \chapter*{符号说明}%
    \addcontentsline{toc}{chapter}{符号说明}
    \vspace{-1em}%
    \begin{longtable}[c]{l@{\extracolsep{3em}}p{#1}}
        #2
}{\end{longtable}}
\setlength{\bibsep}{3pt}
\renewcommand{\emph}[1]{\textbf{#1}}
\renewcommand{\em}{\bfsong}

\newcommand{\buct@ftntcircled}[1]{%
    \lower 0.15em\hbox{%
        \tikz\draw (0pt, 0pt)circle (0.4 em) node {#1};%
    }%
}
\renewcommand\thefootnote{\protect\buct@ftntcircled{\tiny\arabic{footnote}}}
\renewcommand{\@makefntext}[1]{%
    \setlength{\leftskip}{1.5\ccwd}%
    \noindent\llap{\lower 1pt \hbox{\@thefnmark}\,}#1%
}
\urlstyle{same}
\hypersetup{%
    colorlinks         = true,
    bookmarksnumbered  = true,
    pdfhighlight       = /N,
    breaklinks         = true,
    citecolor          = cyan,
}
\ifbuct@submit
    \hypersetup{hidelinks}
\fi
\endinput
%%
%% End of file `buctthesis.cls'.
