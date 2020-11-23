%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%		buctthesis.cls
%%		Copyright Miracle0565
%%
%%		https://github.com/Miracle0565/BUCTthesis
%%
%%		Beta.v0.9.6, Dec.2020
%%
%%	This file may be distributed and/or modified under
%%	the conditions of the LaTeX Project Public License,
%%	either version 1.3c of this license or (at your option)
%%	any later version. The latest version of this license
%%	is in:
%%
%%	http://www.latex-project.org/lppl.txt
%%
%%	and version 1.3c or later is part of all distributions
%%	of LaTeX version 1999/12/01 or later.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

%% class info
\ProvidesClass{buctthesis}[2020/12/10 Beta.v0.9.6]

%% 定义选项 options 
% class options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family	= buct,
	prefix	= buct@,
	setkeys	= \kvsetkeys,
}
\DeclareBoolOption{submit}
\DeclareBoolOption{openany}
\DeclareComplementaryOption{openright}{openany}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*

\PassOptionsToPackage{quiet}{xeCJK}
\ifbuct@openany\LoadClass[zihao=-4,UTF8,oneside]{ctexbook}
\else\LoadClass[zihao=-4,UTF8,openright]{ctexbook}\fi

% \buctsetup{ <key> = <value> }
\NewDocumentCommand{\buct@def@key}{ m }{
	\@namedef{buct#1}##1{\@namedef{buct@#1}{##1}}
	\define@key{buct}{#1}{\@nameuse{buct#1}{##1}}
}

\NewDocumentCommand{\buctsetup}{ m }{\kvsetkeys{buct}{#1}}

\buct@def@key{ctitle}
\buct@def@key{etitle}
\buct@def@key{author}
\buct@def@key{class}
\buct@def@key{studentid}
\buct@def@key{school}
\buct@def@key{major}
\buct@def@key{supervisor}
\buct@def@key{msupervisor}

% XeLaTeX required
\RequirePackage{ifxetex}
\RequireXeTeX

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Basic Packages     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 纸张与页面 pages
\RequirePackage{geometry,fancyhdr}
% 西文字体 fonts
\RequirePackage{fontspec}
% 目录 contents
\RequirePackage{titletoc}
% 数学公式 math
\RequirePackage{amsmath,amsthm,amssymb}
\RequirePackage{unicode-math}
% 列表环境 lists
\RequirePackage{pifont}
\RequirePackage{enumitem}
% 国际单位制 SI units
\RequirePackage{siunitx}
% 无机化学式 chemical fomular
\RequirePackage[version=4]{mhchem}
% 表格 tables
\RequirePackage{longtable,threeparttable,tabularx,multirow,booktabs}
% 插图 figures
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
% 绘图 TikZ
\RequirePackage{tikz}
% 插入PDF
\RequirePackage{pdfpages}
% 浮动体 floats
\RequirePackage[format=hang]{caption}
\RequirePackage{float}
% 代码 codes
\RequirePackage{listings}
% 色彩 colors
\RequirePackage{xcolor}
% 脚注 footnote
\RequirePackage[bottom,perpage]{footmisc}
% 参考文献 bibliography
\RequirePackage[sort&compress]{gbt7714}
% 命令补丁 patching commands
\RequirePackage{xpatch}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Fonts Settings     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 主要字体 text fonts
% 中文字体及伪粗体命令 zh
\xeCJKsetup{EmboldenFactor=2.2,SlantFactor=0.2}
% 宋体 
\setCJKmainfont{SimSun}[AutoFakeBold,AutoFakeSlant]
\newcommand{\bfsong}{\bfseries}
% 黑体 
\setCJKsansfont{SimHei}[AutoFakeBold]
\newcommand{\bfhei}{\sffamily\bfseries}

% 英文字体 en 
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Times New Roman}
% 数学字体 math
%\IfFontExistsTF{Cambria Math}{%
%	\setmathfont{Cambria Math}
%}{%
	\IfFontExistsTF{LibertinusMath-Regular.otf}{%
		\setmathfont{latinmodern-math.otf}
		\setmathfont[%
			range={%
				up/{latin,Latin,num},
				it/{latin,Latin,greek},
				bfit/{latin,Latin},
			}
		]{LibertinusMath-Regular.otf}
	}{}
%}

% 页眉页脚 pages
\newcommand{\buct@headfont}{\zihao{-5}\songti}
\newcommand{\buct@footfont}{\zihao{-5}\songti}

%% 摘要 abstracts
% 中文摘要 zh
\newcommand{\buct@abstitfont}{\zihao{3}\songti}
\newcommand{\buct@absabsfont}{\zihao{4}\heiti}
\newcommand{\buct@keywordsfont}{\zihao{4}\heiti}
% 英文摘要 en
\newcommand{\buct@abstitfonten}{\zihao{3}\bfseries}
\newcommand{\buct@absabsfonten}{\zihao{4}\bfseries}
\newcommand{\buct@keywordsfonten}{\zihao{4}\heiti\CJKfamily+{}}

%% 目录 contents
\newcommand{\buct@toc@tocfont}{\zihao{4}\mdseries\heiti}
\newcommand{\buct@toc@chapfont}{\zihao{4}\heiti}
\newcommand{\buct@toc@secfont}{\zihao{4}\songti}
\newcommand{\buct@toc@ssecfont}{\zihao{4}\songti}
\newcommand{\buct@toc@dsgfigfont}{\buct@toc@ssecfont}

%% 正文各级标题 chapters
\newcommand{\buct@chapfont}{\zihao{-3}\bfsong\centering}
\newcommand{\buct@secfont}{\zihao{-3}\bfsong\centering}
\newcommand{\buct@ssecfont}{\zihao{-4}\bfsong\raggedright}
\newcommand{\buct@sssecfont}{\zihao{-4}\songti}

%% 浮动体 floats
\newcommand{\buct@floatfont}{\zihao{5}\songti}

% 代码 code
\newcommand{\buct@codefont}{\ttfamily\songti\zihao{5}}
\newcommand{\buct@codecomfont}{%
	\ttfamily\slshape
	\ifbuct@submit\relax\else\color{gray!80!black}\fi}
\newcommand{\buct@codekeyfont}{%
	\ttfamily\bfseries
	\ifbuct@submit\relax\else\color{blue!80!black}\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Pages Settings    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

% 纸张边距 page margins
\geometry{
	a4paper,nomarginpar,
	top=3.5cm,bottom=2.6cm,left=2.7cm,right=2.7cm,
	headheight=1.1cm, footskip=0.6cm}

% 页眉页脚 header & footer
\fancypagestyle{plain}{%
	\fancyhf{}
	\fancyfoot[C]{\buct@footfont\thepage}
	\fancyhead[C]{\buct@headfont{北京化工大学毕业设计（论文）}}
	\renewcommand\headrulewidth{0.6pt}
	\renewcommand\footrulewidth{0pt}
}
\pagestyle{plain}

% 页码样式 page number
\xpatchcmd{\frontmatter}
	{\pagenumbering{roman}}
	{\pagenumbering{Roman}}
	{}{}

% 完全空白页 blank page
\xpatchcmd{\cleardoublepage}
	{\newpage}
	{\thispagestyle{empty}\newpage}
	{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Frontmatter Settings  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\buct@pdfmark}[2]{
	\hypertarget{#2}{}
	\pdfbookmark{#1}{#2}
}
%% 诚信声明 declare original
\newenvironment{declare}{%
	\buct@pdfmark{诚信声明}{declare}
	\setlength{\baselineskip}{2em}%
	\centerline{\songti\zihao{3} 诚信声明}\par\vspace{1em}%
	\leftline{\songti\zihao{4}\noindent 本人声明：}%
	\def\addsign{本人签名：\hspace{7em}}
	\def\addsigndate{\hspace{7em}年\hspace{2.5em}月\hspace{2.5em}日}
}{\par\vspace{2em}\hfill\addsign\addsigndate\clearpage}

%% 任务书 taskbook
\NewDocumentCommand{\buct@ul}{ o m }{\underline{\makebox[#1][c]{#2}}}
\newenvironment{taskbook}{
	\cleardoublepage
	\buct@pdfmark{任务书}{taskbook}
	\section*{本科生毕业设计（论文）任务书}%
}{\clearpage}
\newcounter{taskitemcnt}
\newcommand{\buct@taskitem}{
	\stepcounter{taskitemcnt}%
	\ifcase\value{taskitemcnt}\relax\or%
	{1.设计（论文）的主要任务及目标}\or%
	{2.设计（论文）的基本要求和内容}\or%
	{3.主要参考文献}\or%
	{4.进度安排}\else%
	\ClassError{buctthesis}{Too many \protect\taskitem\space used}%
	{Keep \protect\taskitem\space no more than 4 times.}\fi}
\newcommand{\taskitem}{\vspace{1em}\noindent\buct@taskitem\par}

% TODO: use bibentry pkg, or biblatex
\newenvironment{bibenumerate}{%
	\begin{enumerate}[label={[\arabic*]},leftmargin=3em]
}{\end{enumerate}}

% 论文的信息 {\taskinfo} or {\taskinfo*}
\NewDocumentCommand\taskinfo{ s }{%
	\noindent%
	\begin{minipage}{\textwidth}%
		\punctstyle{plain}\linespread{1.94}\selectfont%
			设计（论文）题目：\buct@ul[27em]{\buct@ctitle}\\[3pt]
		\IfBooleanTF{#1}{% less lines break
			学院：\buct@ul[10em]{\buct@school}\quad 
			专业：\buct@ul[10em]{\buct@major}\quad
			班级：\buct@ul[5em]{\buct@class}\\[3pt]
			学生：\buct@ul[5em]{\buct@author}\quad
			指导教师（含职称）：\buct@ul[6em]{\buct@supervisor}\quad
			专业负责人：\buct@ul[4em]{\buct@msupervisor}%
		}{% more lines break
			学院：\buct@ul[15em]{\buct@school}\qquad
			专业：\buct@ul[13em]{\buct@major}\\[3pt]
			班级：\buct@ul[15em]{\buct@class}\qquad
			学生：\buct@ul[13em]{\buct@author}\\[3pt]
			指导教师（含职称）：\buct@ul[8em]{\buct@supervisor}\qquad
			专业负责人：\buct@ul[10em]{\buct@msupervisor}%
		}
\end{minipage}\vspace{1.5em}
}
%% 摘要
% 中、英同页 in one page
% zh
\newenvironment{abstract*}{%
	\cleardoublepage
	\buct@pdfmark{摘要}{abstract}
	\centerline{\buct@abstitfont\buct@ctitle}\vspace{-3pt}%
	\centerline{\buct@absabsfont{摘\quad 要}}\vspace{-3pt}%
	\newcommand{\keywords}{\par\vspace{-0.5ex}\noindent\buct@keywordsfont 关键词：}
	\addtolength{\baselineskip}{-3pt}
}{}
% en
\newenvironment{abstracten*}{%
	\buct@pdfmark{Abstract}{abstracten}
	\centerline{\buct@abstitfonten{\buct@etitle}}\vspace{-6pt}%
	\centerline{\buct@absabsfonten {ABSTRACT}}\vspace{-3pt}%
	\newcommand{\keywordsen}{\par\vspace{-0.5ex}\noindent\buct@keywordsfonten Keywords:~}
	\addtolength{\baselineskip}{-6pt}
}{}
% 中、英不同页 in 2 pages 
% zh
\newenvironment{abstract}{%
	\cleardoublepage
	\buct@pdfmark{摘要}{abstract}
	\centerline{\buct@abstitfont\buct@ctitle}\vspace{12pt}%
	\centerline{\buct@absabsfont{摘\quad 要}}\vspace{9pt}%
	\newcommand{\keywords}{\par\vspace{1em}\noindent\buct@keywordsfont 关键词：}
}{}
% en
\newenvironment{abstracten}{%
	\cleardoublepage%
	\buct@pdfmark{Abstract}{abstracten}
	\centerline{\buct@abstitfonten{\buct@etitle}}\vspace{12pt}%
	\centerline{\buct@absabsfonten{ABSTRACT}}\vspace{9pt}%
	\newcommand{\keywordsen}{\par\vspace{1em}\noindent\buct@keywordsfonten Keywords:~}
}{}

%% 目录 Contents
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

% 目录标题样式 title of toc
\renewcommand\tableofcontents{%
	\cleardoublepage
	\pdfbookmark{\contentsname}{toc}%
	\chapter*{\buct@toc@tocfont{目\quad 录}}%
	\@starttoc{toc}
}

% 目录样式 format of toc
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

% 参考文献编目 bib in toc
\renewcommand{\bibsection}{\chapter*{\bibname}\addcontentsline{toc}{chapter}{\bibname}}

% 设计图纸编入主目录 \designfig
\newcommand{\designfig}[1]{%
	\addcontentsline{toc}{subsection}%
	{\hspace{2.5em}设计图纸\thefigure\hspace{1em}{#1}}}
	
% 设计图纸目录 lodf
\newcommand{\buct@listof}[2]{%
	\xpatchcmd{\@dottedtocline}{\hbox{.}}{\hbox{$\cdot$}}{}{}
	\renewcommand{\@dotsep}{1.7}%
	\@ifundefined{ext@#1}{\float@error{#1}}{%
	\@namedef{l@#1}{\@dottedtocline{1}{0em}{2em}}
	\float@listhead{\buct@toc@tocfont{}#2}%
	\begingroup\setlength{\parskip}{\z@}%
	\buct@toc@dsgfigfont\@starttoc{\@nameuse{ext@#1}}%
	\endgroup}}
\newcommand{\listofdesignfigures}{
	\cleardoublepage%
	\buct@pdfmark{设计图纸目录}{dfigure}%
	\buct@listof{dfigure}{设计图纸目录}
}

%% 前言 foreword
\newenvironment{foreword}{%
	\cleardoublepage
	\buct@pdfmark{前言}{foreword}
	\chapter*{前\quad 言}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Mainmatter Settings   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 行距 lineskip 
\linespread{1.52}\selectfont

%% 各级标题样式 title format
\ctexset{%
chapter = {%
	name		= {第,章},
	number		= \arabic{chapter},
	format		= \buct@chapfont,
	beforeskip	= 12 pt,
	afterskip	= 32 pt,
	fixskip		= true,
	aftername	= \qquad,
},
section = {%
	name		= {第,节},
	format		= \buct@secfont,
	aftername	= \quad,
	beforeskip	= 29 pt,
	afterskip	= 32 pt,
	fixskip		= true,
},
subsection = {%
	format		= \buct@ssecfont,
	aftername	= \quad,
	beforeskip	= 3 pt,
	afterskip	= 3 pt,
},
subsubsection = {%
	name		= {(,)},
	format		= \buct@sssecfont,
	number		= \arabic{subsubsection},
	beforeskip	= 3pt,
	afterskip	= 3pt,
	aftername	= \hspace{0.5em},
	indent		= 0.5em,
},
figurename	= 图,
tablename	= 表,
bibname		= 参考文献,
}

% 结论，编入目录 conclusion
\newenvironment{conclusion}{%
	\chapter*{结\quad 论}
	\addcontentsline{toc}{chapter}{结论}
}{}
% 符号说明，编入目录 denotation
\newenvironment{denotation}[2]{%
	\chapter*{符号说明}%
	\addcontentsline{toc}{chapter}{符号说明}
	\vspace{-1em}%
	\begin{longtable}[c]{p{#1}p{#2}}
}{\end{longtable}}

% 翻译，编入目录 translation
\newenvironment{translation}{%
	\chapter*{翻\quad 译}
	\addcontentsline{toc}{chapter}{翻译}
}{}

% 致谢，编入目录 ack
\newenvironment{acknowledgement}{%
	\chapter*{致\quad 谢}
	\addcontentsline{toc}{chapter}{致谢}
}{}

% 列表环境 lists
\setlist{%
	leftmargin = 2em,
	nosep,
}
\setlist[enumerate,1]{%
	label = \lower 0.1em\hbox{\large{\ding{\numexpr191+\value{enumi}}}},
	labelsep = 2pt,
}
\setlist[enumerate,2]{%
	labelsep = 6pt,
}
\setlist[description]{%
	labelsep= 1em,
}

%% 数学 math settings
%% 公式 formula
\unimathsetup{%
	math-style = ISO,
	bold-style = ISO,
	partial = upright,
}
\let\mathbb\relax
\DeclareMathAlphabet{\mathbb}{U}{msb}{m}{n}%

% 修复 amsmath 的命令，采用 bm 宏包的形式
\renewcommand\boldsymbol{\symbf}
\newcommand\bm{\symbf}

%% 定理 theorem
\newtheoremstyle{buctthm}%	name
{3pt}%						Space above
{3pt}%						Space below
{}%							Body font
{}%							Indent amount
{\bfseries}%				Theorem head font
{:}%						Punctuation after theorem head
{.5em}%						Space after theorem head
{}%							Theorem head spec
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
% 证明 proof
\renewenvironment{proof}[1][\proofname]{\par
	\pushQED{\qed}%
	\normalfont \topsep6\p@\@plus6\p@\relax
	\trivlist
	\item\relax
	{#1\@addpunct{.}}\hspace\labelsep\ignorespaces
}{\popQED\endtrivlist\@endpefalse}

%% SI 单位
\sisetup{%
	list-final-separator = { 和 },
	list-pair-separator = { 和 },
	range-phrase = {$\sim$},
}

%% 设计图纸 design figure
\newfloat{dfigure}{htbp}{lodf}[chapter]
\floatname{dfigure}{设计图纸}

% 插图目录 path of pics
\graphicspath{{figure/}}

%% 图、表、方程标签格式 caption of floats, eqs & codes
\renewcommand{\captionfont}{\buct@floatfont}
\renewcommand{\captionlabelfont}{\buct@floatfont}
\DeclareCaptionLabelSeparator{capspace}{\quad}
\captionsetup{labelsep=capspace}
% spaces
\captionsetup[table]{%
	position = top,
	aboveskip = 0.5em,
	belowskip = 0.5em,
}
\captionsetup[figure]{%
	position = bottom,
	aboveskip = 0.5em,
	belowskip = -0.5em,
}
\captionsetup[dfigure]{%
	position = bottom,
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

% 代码 code
\lstset{%
	%lineskip = -3pt,
	aboveskip		= 0.5em,
	belowskip		= 0.5em,
	tabsize			= 4,
	basicstyle		= \buct@codefont,
	frame			= single,
	basewidth		= {.5em,.4em},
	xleftmargin		= 1.5em,
	xrightmargin	= 1.5em,
	commentstyle	= \buct@codecomfont,
	keywordstyle	= \buct@codekeyfont,
	backgroundcolor	= \color{lightgray!10},
	showtabs		= false,
	showspaces		= false,
	showstringspaces= false,
	captionpos		= t,
	breaklines		= true,
	numbers			= left,
	numberstyle		= \tiny,
	numbersep		= 6 pt,
	stepnumber		= 1,
	extendedchars	= false,
	escapechar		= {@*},
}
\renewcommand{\lstlistingname}{代码}

% 参考文献 bib
\setlength{\bibsep}{3pt}

%%%%%%%%%%%%%%%%%%%%%%%
%%   Other Settings  %%
%%%%%%%%%%%%%%%%%%%%%%%

%% \emph \em 命令使用粗宋体
\renewcommand{\emph}[1]{\textbf{#1}}
\renewcommand{\em}{\bfsong}

%% 脚注 footnote
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

%% URL
\urlstyle{same}

\RequirePackage{hyperref}
\hypersetup{%
	colorlinks			= true,
	bookmarksnumbered	= true,
	pdfhighlight		= /N,
	breaklinks			= true,
	citecolor			= cyan,
}
\ifbuct@submit
	\hypersetup{hidelinks}
\fi

\endinput

%% End of file `buctthesis.cls'.