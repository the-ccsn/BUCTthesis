%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%		buctthesis.cls
%%		Copyright Miracle0565
%%
%%		https://github.com/Miracle0565/BUCTthesis
%%
%%		Beta.v0.9.4, June.2020
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
\ProvidesClass{buctthesis}[2020/05/24 Beta.v0.9.4]

%% 文档类选项 class options
\newif\ifbuct@textblack
\newif\ifbuct@lesstoc
\DeclareOption{TextBlack}{\buct@textblacktrue}
\DeclareOption{LessTOC}{\buct@lesstoctrue}
\newcommand{\buct@less@toc}[1]{%
	\ifbuct@lesstoc\else\addcontentsline{toc}{chapter}{#1}\fi
}
%\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[zihao=-4,UTF8,oneside]{ctexbook}

% 定义选项 options 
\RequirePackage{xparse}
\RequirePackage{xkeyval,kvsetkeys}

\NewDocumentCommand\buct@def@key{m}{%
	\@namedef{buct#1}##1{\@namedef{buct@#1}{##1}}%
	\define@key{buct}{#1}{\csname buct#1\endcsname{##1}}}
\NewDocumentCommand{\buctsetup}{m}{\kvsetkeys{buct}{#1}}

\buct@def@key{Title}
\buct@def@key{Titleen}
\buct@def@key{Author}
\buct@def@key{Class}
\buct@def@key{School}
\buct@def@key{Major}
\buct@def@key{Supervisor}
\buct@def@key{MajorSupervisor}

% XeLaTeX required
\RequirePackage{ifxetex}
\RequireXeTeX


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	 	Basic Packages	 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
\RequirePackage{longtable,threeparttable,dcolumn,tabularx,multirow,booktabs}
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
%\RequirePackage{bibentry}
\RequirePackage[sort&compress]{gbt7714}
%\nobibliography*{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	   Fonts Settings	 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 主要字体 text fonts
% 中文字体 zh
\xeCJKsetup{EmboldenFactor=2.2,SlantFactor=0.2}
\let\songti\relax
\newCJKfontfamily\songti{SimSun}[AutoFakeBold,AutoFakeSlant]
\let\heiti\relax
\newCJKfontfamily\heiti{SimHei}[AutoFakeBold]
\newcommand{\bfsong}{\songti\bfseries}
\newcommand{\bfhei}{\heiti\bfseries}
% 英文字体 en 
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Times New Roman}
% 数学字体 math
%\IfFontExistsTF{Cambria Math}{%
%	\setmathfont{Cambria Math}
%}{%
	\IfFontExistsTF{XITSMath-Regular.otf}{%
		\setmathfont{latinmodern-math.otf}
		\setmathfont[%
			range={%
				up/{latin,Latin,num},
				it/{latin,Latin,greek},
				bfit/{latin,Latin},
			}
		]{XITSMath-Regular.otf}
	}{}
%}

% 页眉页脚 pages
\newcommand{\buct@headfont}{\zihao{-5}\songti}
\newcommand{\buct@footfont}{\zihao{-5}\songti}

%% 摘要 abstracts
% 中文摘要 zh
\newcommand{\buct@abstitfont}{\zihao{3}}
\newcommand{\buct@absabsfont}{\zihao{4}\heiti}
\newcommand{\buct@keywordsfont}{\zihao{4}\heiti}
% 英文摘要 en
\newcommand{\buct@abstitfonten}{\zihao{3}\bfseries}
\newcommand{\buct@absabsfonten}{\zihao{4}\bfseries}
\newcommand{\buct@keywordsfonten}{\zihao{4}\CJKfamily+{}\bfseries}

%% 目录 contents
\newcommand{\buct@toc@tocfont}{\mdseries\heiti\zihao{4}}
\newcommand{\buct@toc@chapfont}{\bfseries\zihao{4}}
\newcommand{\buct@toc@secfont}{\songti\zihao{4}}
\newcommand{\buct@toc@ssecfont}{\songti\zihao{4}}
\newcommand{\buct@toc@dsgfigfont}{\buct@toc@ssecfont}

%% 正文各级标题 chapters
\newcommand{\buct@chapfont}{\bfsong\centering\zihao{-3}}
\newcommand{\buct@secfont}{\bfsong\centering\zihao{-3}}
\newcommand{\buct@ssecfont}{\bfsong\raggedright\zihao{-4}}
\newcommand{\buct@sssecfont}{\songti\zihao{-4}}

%% 浮动体 floats
\newcommand{\buct@floatfont}{\zihao{5}}

% 代码 code
\newcommand{\buct@codefont}{\ttfamily\songti\zihao{5}}
\newcommand{\buct@codecomfont}{%
	\ttfamily\slshape
	\ifbuct@textblack\else\color{gray!80!black}\fi}
\newcommand{\buct@codekeyfont}{%
	\ttfamily\bfseries
	\ifbuct@textblack\else\color{blue!80!black}\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	 Pages Settings		%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

% 纸张边距 page margins
\RequirePackage{geometry}
\geometry{
	a4paper,nomarginpar,
	top=3.5cm,bottom=2.6cm,left=2.7cm,right=2.7cm,
	headheight=1.1cm, footskip=0.6cm}

% 页眉页脚 header & footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\buct@headfont\thepage}
\fancyhead[C]{\buct@footfont{北京化工大学毕业设计（论文）}}
\renewcommand\headrulewidth{0.6pt}
\renewcommand\footrulewidth{0pt}

\fancypagestyle{plain}{%
	\fancyfoot[C]{\buct@headfont\thepage}
	\fancyhead[C]{\buct@footfont{北京化工大学毕业设计（论文）}}
	\renewcommand\headrulewidth{0.6pt}
	\renewcommand\footrulewidth{0pt}
}

% 页码样式 page number
\renewcommand{\frontmatter}{
	\pagenumbering{Roman}
	\pagestyle{plain}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Frontmatter Settings  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 诚信声明
\newenvironment{declare}{%
	\phantomsection{}%
	\buct@less@toc{诚信声明}
	\setlength{\baselineskip}{2em}%
	\centerline{\songti\zihao{3} 诚信声明}\par\vspace{1em}%
	\leftline{\songti\zihao{4}\noindent 本人声明：}%
	\def\addsign{本人签名：\hspace{7em}}
	\def\addsigndate{\hspace{7em}年\hspace{2.5em}月\hspace{2.5em}日}
}{\par\vspace{2em}\hfill\addsign\addsigndate\clearpage}

%% 任务书
\newenvironment{taskbook}{
	\phantomsection{}
	\buct@less@toc{毕业设计（论文）任务书}%
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
\newcommand{\taskitem}{\noindent\buct@taskitem\par}%

% TODO:bibitem
\newenvironment{bibenumerate}{%
	\begin{enumerate}[label={[\arabic*]},leftmargin=3em]
}{\end{enumerate}}
\newcommand{\taskinfo}{%
	\noindent%
	\begin{minipage}{\textwidth}%
		\punctstyle{plain}\linespread{1.94}\selectfont%
		设计（论文）题目：\underline{\makebox[27em][c]{\buct@Title}}\\[3pt]
		学院：\underline{\makebox[10em][c]{\buct@School}}\quad 
		专业：\underline{\makebox[10em][c]{\buct@Major}}\quad
		班级：\underline{\makebox[5em][c]{\buct@Class}}\\[3pt]
		学生：\underline{\makebox[5em][c]{\buct@Author}}\quad
		指导教师（含职称）：\underline{\makebox[6em][c]{\buct@Supervisor}}\quad
		专业负责人：\underline{\makebox[4em][c]{\buct@MajorSupervisor}}%
		\end{minipage}\vspace{2.5em}
}
\newcommand{\Taskinfo}{%
	\noindent%
	\begin{minipage}{\textwidth}%
		\punctstyle{plain}\linespread{1.94}\selectfont%
		设计（论文）题目：\underline{\makebox[27.25em][c]{\buct@Title}}\\[3pt]
		学院：\underline{\makebox[15em][c]{\buct@School}}\hspace{2em}
		专业：\underline{\makebox[13em][c]{\buct@Major}}\\[3pt]
		班级：\underline{\makebox[15em][c]{\buct@Class}}\hspace{2em}
		学生：\underline{\makebox[13em][c]{\buct@Author}}\\[3pt]
		指导教师（含职称）：\underline{\makebox[8em][c]{\buct@Supervisor}}\hspace{2em}
		专业负责人：\underline{\makebox[10em][c]{\buct@MajorSupervisor}}%
		\end{minipage}\vspace{2.5em}
}
%% 摘要
% 中、英文摘要同一页：
% 中文摘要
\newenvironment{abstract*}{%
	\phantomsection{}%
	\buct@less@toc{摘要}
	\centerline{\buct@abstitfont\buct@Title}\vspace{-3pt}%
	\centerline{\buct@absabsfont{摘\quad 要}}\vspace{-3pt}%
	\newcommand{\keywords}{\par\vspace{-0.5ex}\noindent\buct@keywordsfont 关键词：}
	\addtolength{\baselineskip}{-3pt}
}{}
% 英文摘要
\newenvironment{abstracten*}{%
	\phantomsection{}%
	\buct@less@toc{ABSTRACT}
	\centerline{\buct@abstitfonten{\buct@Titleen}}\vspace{-6pt}%
	\centerline{\buct@absabsfonten {ABSTRACT}}\vspace{-3pt}%
	\newcommand{\keywordsen}{\par\vspace{-0.5ex}\noindent\buct@keywordsfonten Keywords:~}
	\addtolength{\baselineskip}{-6pt}
}{}
% 中、英文摘要分为两页：
% 中文摘要
\newenvironment{abstract}{%
	\clearpage%
	\phantomsection{}%
	\buct@less@toc{摘要}
	\centerline{\buct@abstitfont\buct@Title}\vspace{6pt}%
	\centerline{\buct@absabsfont{摘\quad 要}}\vspace{3pt}%
	\newcommand{\keywords}{\par\vspace{1em}\noindent\buct@keywordsfont 关键词：}

}{}
% 英文摘要
\newenvironment{abstracten}{%
	\clearpage%
	\phantomsection{}%
	\buct@less@toc{ABSTRACT}
	\centerline{\buct@abstitfonten{\buct@Titleen}}\vspace{6pt}%
	\centerline{\buct@absabsfonten{ABSTRACT}}\vspace{3pt}%
	\newcommand{\keywordsen}{\par\vspace{1em}\noindent\buct@keywordsfonten Keywords:~}
}{}

%% 目录 Contents
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

% 参考文献编目
\RequirePackage[nottoc]{tocbibind}

% 目录标题样式
\renewcommand\tableofcontents{%
	\pdfbookmark{目录}{toc}%
	\chapter*{\buct@toc@tocfont 目\quad 录}%
	\@starttoc{toc}}

% 目录样式
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

% 设计图纸编如主目录 \designfig
\newcommand{\designfig}[1]{%
	\addcontentsline{toc}{subsection}%
	{\hspace{2.5em}设计图纸\thefigure\hspace{1em}{#1}}}
% 设计图纸目录 TODO
\newcommand{\buct@listof}[2]{%
	\renewcommand{\@dotsep}{1.7}%
	\@ifundefined{ext@#1}{\float@error{#1}}{%
	\@namedef{l@#1}{\@dottedtocline{1}{0em}{2em}}%
	\float@listhead{\buct@toc@tocfont #2}%
	\begingroup\setlength{\parskip}{\z@}%
	\buct@toc@dsgfigfont\@starttoc{\@nameuse{ext@#1}}%
	\endgroup}}
\newcommand{\listofdesignfigures}{\buct@listof{dfigure}{设计图纸目录}}

%% 前言
\newenvironment{foreword}{%
	\chapter*{前\quad 言}
	\buct@less@toc{前言}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Mainmatter Settings   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 行间距
\linespread{1.52}\selectfont

%% 各级标题样式
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

% 结论，编入目录
\newenvironment{conclusion}{%
	\chapter*{结\quad 论}
	\addcontentsline{toc}{chapter}{结论}
}{}
% 符号说明，编入目录
\newenvironment{denotation}[2]{%
	\chapter*{符号说明}%
	\addcontentsline{toc}{chapter}{符号说明}
	\begin{longtable}[c]{p{#1}p{#2}}
		\toprule
		\textbf{符号} & \textbf{说明}\\* \midrule
		\endfirsthead
		\multicolumn{2}{r}{\songti\small\textbf{（接上表）}}\\
		\toprule
		\textbf{符号} & \textbf{说明}\\* \midrule
		\endhead
		\bottomrule
		\endfoot
		\endlastfoot
}{\bottomrule\end{longtable}}

% 翻译，编入目录
\newenvironment{translation}{%
	\chapter*{翻\quad 译}
	\addcontentsline{toc}{chapter}{翻译}
}{}

% 致谢，编入目录
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
{\bfseries\songti}%			Theorem head font
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

%% 图、表、方程标签格式 caption of floats
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
\renewcommand{\thesubtable}{(\alph{subtable})}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\theequation}{式~\arabic{chapter}-\arabic{equation}}
\renewcommand{\thedfigure}{\arabic{chapter}-\arabic{dfigure}}
%% 附录 appendix
\let\old@appendix\appendix
\newcommand{\buct@appendix}{%
	\old@appendix
	\renewcommand{\thetable}{\Alph{chapter}-\arabic{table}}
	\renewcommand{\thefigure}{\Alph{chapter}-\arabic{figure}}
	\renewcommand{\theequation}{式~\Alph{chapter}-\arabic{equation}}
	\renewcommand{\thedfigure}{\Alph{chapter}-\arabic{dfigure}}
}
\let\appendix\buct@appendix
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
%\AtBeginDocument{
%\renewcommand{\thelstlisting}{\arabic{chapter}-\arabic{lstlisting}}
%}

% 参考文献 bib
\setlength{\bibsep}{3pt}

%%%%%%%%%%%%%%%%%%%%%%%
%%	 Other Settings	 %%
%%%%%%%%%%%%%%%%%%%%%%%

%% \emph \em 命令使用粗宋体
\renewcommand{\emph}[1]{\textbf{\songti #1}}
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

%% URL链接断行 line breaks in URL
\RequirePackage{url}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
	\do0\do1\do2\do3\do4\do5\do6\do7\do8\do9%
	\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M%
	\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z%
	\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m%
	\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z%
}
\Urlmuskip=0mu plus 0.1mu


\RequirePackage{hyperref}
\hypersetup{%
	colorlinks=true,
	bookmarksnumbered=true,
	pdfhighlight=/N,
	breaklinks=true,
	citecolor=cyan,
}
\ifbuct@textblack
	\hypersetup{hidelinks}
\fi

%% End of file `buctthesis.cls'.
