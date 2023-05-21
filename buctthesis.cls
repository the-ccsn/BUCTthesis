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
%% Copyright (C) 2019-2022 by Miracle0565
%% Copyright (C) 2022-2023 by The-CCSN
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
\ProvidesClass{buctthesis}[2022/05/20 v2.0 BUCT Thesis Template]
\RequirePackage{ifxetex}
\RequireXeTeX
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family   = buct,
    prefix   = buct@,
    setkeys  = \kvsetkeys,
}
\newif\ifbuct@bachelor\buct@bachelorfalse
\newif\ifbuct@master\buct@masterfalse
\newif\ifbuct@doctor\buct@doctorfalse
\define@key{buct}{type}{\expandafter\csname buct@#1true\endcsname}
\DeclareBoolOption[false]{submit}
\DeclareBoolOption[false]{openany}
\DeclareComplementaryOption{openright}{openany}
\DeclareBoolOption[false]{debugger}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\PassOptionsToPackage{quiet}{xeCJK}
\ifbuct@openany\LoadClass[zihao=-4,UTF8,oneside]{ctexbook}
\else\LoadClass[zihao=-4,UTF8,openright]{ctexbook}\fi
\ifbuct@bachelor\relax\else
    \ifbuct@master\relax\else
        \ifbuct@doctor\relax\else
            \ClassError{buctthesis}{%
                Specified thesis type is obligatory: \MessageBreak%
                type = [ bachelor | master | doctor ]%
            }{}
\fi\fi\fi
\NewDocumentCommand{\buct@def@key}{ m o }{
    \@namedef{#1}##1{\@namedef{buct@#1}{##1}}
    \define@key{buct}{#1}[#2]{\@nameuse{#1}{##1}}
}
\newcommand{\buctsetup}[1]{\kvsetkeys{buct}{#1}}
\buct@def@key{ChineseTitle}
\buct@def@key{EnglishTitle}
\buct@def@key{ChineseTitleLineA}
\buct@def@key{ChineseTitleLineB}
\buct@def@key{ChineseTitle}
\buct@def@key{author}
\buct@def@key{studentid}
\buct@def@key{supervisor}
\buct@def@key{major}
\buct@def@key{date}[\the\year-\two@digits{\month}-\two@digits{\day}]
\ifbuct@bachelor
    \buct@def@key{school}
    \buct@def@key{class}
    \buct@def@key{msupervisor}
\fi
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
\buct@def@sep@key{ChineseKeywords}{\buct@ChineseKeywords@sep}
\buct@def@sep@key{EnglishKeywords}{\buct@EnglishKeywords@sep}
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
\RequirePackage{bicaption}
\RequirePackage{tikz}
\RequirePackage{calc}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{xeCJKfntef}
\RequirePackage{listings}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage{xcolor}
\RequirePackage{pdfpages}
\RequirePackage[bottom,perpage]{footmisc}
\RequirePackage{xpatch}
\RequirePackage{xifthen}
\ifbuct@debugger
    \RequirePackage[color=blue,type=upperleft,showframe,hshift=2.7cm,vshift=3.5cm]{fgruler}
    \RequirePackage[pagewise]{lineno}
\fi
\RequirePackage{hyperref}
\newcommand\buct@fontsetval{\csname g__ctex_fontset_tl\endcsname}
\ifthenelse{\equal{\buct@fontsetval}{windows}}{
    \xeCJKsetup{EmboldenFactor=2.2,SlantFactor=0.2}
    \setCJKmainfont{SimSun}[AutoFakeBold,AutoFakeSlant]
    \setCJKsansfont{SimHei}[AutoFakeBold]
}
{
    \ClassWarning{buctthesis}{%
        The fonts differ to the default.\MessageBreak%
        Use fontset = windows to correct.%
    }
}
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
\xeCJKDeclareCharClass{CJK}{"2460->"2469}
\newcommand{\buct@headfont}{\zihao{-5}\songti}
\newcommand{\buct@footfont}{\zihao{-5}\songti}
\ifbuct@bachelor
    \newcommand{\buct@dcl@titlefont}{\zihao{3}\songti}
    \newcommand{\buct@dcl@ideclarefont}{\zihao{4}\songti}
\else
    \newcommand{\buct@dcl@titlefont}{\zihao{4}\bfseries}
    \newcommand{\buct@dcl@textfont}{\zihao{4}\mdseries}
    \newcommand{\buct@auth@titlefont}{\zihao{4}\bfseries}
    \newcommand{\buct@auth@textfont}{\zihao{4}\mdseries}
\fi
\ifbuct@bachelor
    \newcommand{\buct@abs@titfont}{\zihao{3}\bfsong}
    \newcommand{\buct@abs@infofont}{\zihao{5}\mdseries}
    \newcommand{\buct@abs@absfont}{\zihao{4}\songti}
    \newcommand{\buct@keywordsfont}{\zihao{4}\heiti\CJKfamily+{}}
    \newcommand{\buct@abs@titfonten}{\zihao{3}\bfseries}
    \newcommand{\buct@abs@absfonten}{\zihao{4}\songti}
    \newcommand{\buct@keywordsfonten}{\zihao{4}\heiti\CJKfamily+{}}
\else
    \newcommand{\buct@abs@titfont}{\zihao{3}\heiti}
    \newcommand{\buct@abs@absfont}{\zihao{-3}\heiti}
    \newcommand{\buct@abs@textfont}{\zihao{4}\songti}
    \newcommand{\buct@keywords@titfont}{\zihao{4}\heiti}
    \newcommand{\buct@keywords@font}{\zihao{4}\songti}
    \newcommand{\buct@abs@titfonten}{\zihao{3}\bfseries}
    \newcommand{\buct@abs@absfonten}{\zihao{-3}\bfseries}
    \newcommand{\buct@keywords@titfonten}{\zihao{4}\bfseries}
    \newcommand{\buct@keywords@fonten}{\zihao{4}\mdseries}
\fi
\ifbuct@bachelor
    \newcommand{\buct@toc@tocfont}{\zihao{4}\mdseries\heiti}
\else
    \newcommand{\buct@toc@tocfont}{\zihao{3}\heiti}
\fi
\newcommand{\buct@toc@chapfont}{\zihao{4}\heiti}
\newcommand{\buct@toc@secfont}{\zihao{4}\songti}
\newcommand{\buct@toc@ssecfont}{\zihao{4}\songti}
\newcommand{\buct@toc@sssecfont}{\zihao{-4}\songti}
\newcommand{\buct@toc@dsgfigfont}{\buct@toc@ssecfont}
\newcommand{\buct@toce@chapfont}{\zihao{4}\bfseries}
\ifbuct@bachelor
    \newcommand{\buct@chapfont}{\zihao{-3}\bfsong\centering}
    \newcommand{\buct@secfont}{\zihao{-3}\bfsong\centering}
    \newcommand{\buct@ssecfont}{\zihao{-4}\bfsong\raggedright}
    \newcommand{\buct@sssecfont}{\zihao{-4}\songti}
\else
    \newcommand{\buct@chapfont}{\zihao{3}\heiti\centering}
    \newcommand{\buct@secfont}{\zihao{4}\heiti\raggedright}
    \newcommand{\buct@ssecfont}{\zihao{-4}\heiti\raggedright}
    \newcommand{\buct@sssecfont}{\buct@ssecfont}
\fi
\newcommand{\buct@floatfont}{\zihao{5}}
\newcommand{\buct@float@captionfont}{\zihao{5}\mdseries}
\newcommand{\buct@float@labelfont}{\zihao{5}\mdseries}
\newcommand{\buct@codefont}{\ttfamily\songti\zihao{5}}
\newcommand{\buct@codecomfont}{%
    \ttfamily\slshape
    \ifbuct@submit\relax\else\color{gray!80!black}\fi}
\newcommand{\buct@codekeyfont}{%
    \ttfamily\bfseries
    \ifbuct@submit\relax\else\color{blue!80!black}\fi}
\ifbuct@bachelor
    \newcommand\buct@headtext{北京化工大学毕业设计（论文）}
    \newcommand\buct@foottext{\thepage}
    \newcommand\buct@dcl@title{诚信声明}
    \newcommand\buct@dcl@ideclare{本人声明：}
    \newcommand\buct@dcl@text{
        所呈交的学位论文是本人在导师的指导下独立进行研究工作所取得的成果。
        据我所知，除文中已经注明引用的内容外，本论文不包含任何其他个人或集体
        已经发表或撰写过的研究成果，也不包含为获得北京化工大学或其它教育机构
        的学位或证书而使用过的材料。对论文所涉及的研究工作做出贡献的其他个人
        和集体，均已在文中以明确方式标明或致谢。本人完全意识到本声明的法律
        结果由本人承担。
    }
    \newcommand\buct@dcl@sign{本人签名：\hspace{14em}年\hspace{2.5em}月\hspace{2.5em}日}
    \newcommand\buct@task@title{本科生毕业设计（论文）任务书}
    \newcommand\buct@task@pdf{任务书}
    \newcommand\buct@task@ChineseTitle{设计（论文）题目：}
    \newcommand\buct@task@school{学院：}
    \newcommand\buct@task@major{专业：}
    \newcommand\buct@task@class{班级：}
    \newcommand\buct@task@student{学生：}
    \newcommand\buct@task@supervisor{指导教师（含职称）：}
    \newcommand\buct@task@msupervisor{专业负责人：}
    \newcommand\buct@task@itema{1.设计（论文）的主要任务及目标}
    \newcommand\buct@task@itemb{2.设计（论文）的基本要求和内容}
    \newcommand\buct@task@itemc{3.主要参考文献}
    \newcommand\buct@task@itemd{4.进度安排}
    \newcommand\buct@cabstract@title{摘要}
    \newcommand\buct@eabstract@title{ABSTRACT}
    \newcommand\buct@ChineseKeywords@title{关键词：}
    \newcommand\buct@EnglishKeywords@title{Keywords:~}
    \newcommand\buct@ChineseKeywords@sep{\quad}
    \newcommand\buct@EnglishKeywords@sep{; }
    \newcommand\buct@supervisor@title{指导教师：}
    \newcommand\buct@content@title{目\hspace{\ccwd}录}
    \newcommand\buct@dfigurename{设计图纸}
    \newcommand\buct@dfigure@content@title{设计图纸目录}
    \newcommand\buct@foreword@title{前言}
    \newcommand\buct@concl@title{结论}
    \newcommand\buct@trans@title{翻译}
    \newcommand\buct@ack@title{致谢}
    \newcommand\buct@deno@title{符号说明}
    \renewcommand\lstlistingname{代码}
\else
    \newcommand\buct@headtext{\leftmark}
    \newcommand\buct@foottext{\thepage}
    \newcommand\buct@dcl@title{北京化工大学学位论文原创性声明}
    \newcommand\buct@dcl@text{
        本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立
        进行研究工作所取得的成果。除文中已经注明引用的内容外，本论
        文不含任何其他个人或集体已经发表或撰写过的作品成果。对本文
        的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。
        本人完全意识到本声明的法律结果由本人承担。
    }
    \newcommand\buct@auth@title{关于论文使用授权的说明}
    \newcommand\buct@auth@text{
        学位论文作者完全了解北京化工大学有关保留和使用学位论文的规定，
        即：研究生在校攻读学位期间论文工作的知识产权单位属北京化工大学。
        学校有权保留并向国家有关部门或机构送交论文的复印件和磁盘，允许
        学位论文被查阅和借阅；学校可以公布学位论文的全部或部分内容，
        可以允许采用影印、缩印或其它复制手段保存、汇编学位论文。

        $\Box$ 论文暂不公开（或保密）注释：本学位论文属于暂不公开
        （或保密）范围，在\rule{1.5em}{.4pt}年解密后适用本授权书。

        $\Box$ 非暂不公开（或保密）论文注释：本学位论文不属于暂不公开
        （或保密）范围，适用本授权书。
    }
    \newcommand\buct@dcl@pdf{版权页}
    \newcommand\buct@sign@author{作者签名：\rule{7em}{.4pt}\qquad{日期：}\rule{7em}{.4pt}}
    \newcommand\buct@sign@supervisor{导师签名：\rule{7em}{.4pt}\qquad{日期：}\rule{7em}{.4pt}}
    \newcommand\buct@cabstract@title{摘\hspace{\ccwd}要}
    \newcommand\buct@eabstract@title{ABSTRACT}
    \newcommand\buct@ChineseKeywords@title{关键词：}
    \newcommand\buct@EnglishKeywords@title{KEY WORDS:~}
    \newcommand\buct@ChineseKeywords@sep{，}
    \newcommand\buct@EnglishKeywords@sep{,~}
    \newcommand\buct@content@title{目\hspace{\ccwd}录}
    \newcommand\buct@econtent@chapter{Chapter~}
    \newcommand\buct@econtentsname{Contents}
    \newcommand\buct@deno@title{符号和缩略词说明}
    \newcommand\buct@ack@title{致谢}
    \newcommand\buct@eack@title{Acknowledgement}
    \newcommand\buct@achi@title{研究成果及发表的学术论文}
    \newcommand\buct@eachi@title{Research Results and Published Academic Papaers}
    \newcommand\buct@resu@title{作者及导师简介}
    \newcommand\buct@eresu@title{About the Author}
    \newcommand\equationname{式}
    \newcommand\buct@bitable@name{Table}
    \newcommand\buct@bifigure@name{Figure}
    \newcommand\buct@ebib@title{Bibliography}
    \renewcommand\lstlistingname{代码}
\fi
\geometry{%
    a4paper,nomarginpar,
    top = 3.5cm, bottom = 2.6cm, left = 2.7cm, right = 2.7cm,
    headheight = 1.1cm, footskip = 0.6cm,
}
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyhead[C]{\buct@headfont\buct@headtext}
    \fancyfoot[C]{\buct@footfont\buct@foottext}
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
%% \subsection{封面}
\newcommand\buct@title@ul[1]{%
    \CJKunderline{\makebox[\widthof{\buct@ChineseTitleLineA\enspace}][l]{#1}}
}
\newcommand\buct@major@ul[1]{%
    \CJKunderline{\makebox[\widthof{\buct@major\quad}][c]{#1}}
}
\newcommand\buct@format@date[1]{%
    \edef\buct@@date{\buct@date}%
    \def\buct@@process@date##1-##2-##3\@nil{%
        #1{##1}{##2}{##3}%
    }%
    \expandafter\buct@@process@date\buct@@date\@nil
}
\newcommand\@zhdate[3]{%
    \bfseries\zhkai
    \ifbuct@bachelor
        \zihao{4}
        #1年\makebox[1.5em]{#2}月\makebox[1.5em]{#3}日
    \else
        \Large\ziju{.1}%
        日\hspace{1.5\ccwd}期：\zhdigits{#1}年\zhnumber{#2}月\zhnumber{#3}日%
    \fi
}
\newcommand{\buct@makecover}{%
    \newgeometry{
        top = 2.1cm, bottom = 2.2cm,
        left = 2cm, right = 2cm,
        headheight = 0cm, footskip = 0cm
    }
    \thispagestyle{empty}
    \xeCJKsetup{EmboldenFactor=2.3}
    \begin{table}[h]
        \raggedleft
        \ifbuct@bachelor
            \songti\zihao{5}
        \else
            \renewcommand{\arraystretch}{1.3}\large
        \fi
        \begin{tabular}{l@{}l}
            \ifbuct@bachelor%
                班\hspace{2\ccwd}级&：\CJKfamily+{zhsong}\buct@class\hspace*{2\ccwd}\\
                学\hspace{2\ccwd}号&：\CJKfamily+{zhsong}\buct@studentid\hspace*{2\ccwd}\\
            \else%
                \xbsong 单位代码 & ：\CJKfamily+{zhsong}\mbox{10010}\\
                \xbsong 学\hspace{2\ccwd}号 & ：\CJKfamily+{zhsong}\mbox{\buct@studentid}\\
            \fi
        \end{tabular}
    \end{table}
    \ifbuct@bachelor\vspace{3bp}\else\vspace{26bp}\fi
    \begin{minipage}[c][][c]{2.35cm}
        \includegraphics[width = 2.35cm]{figure/BUCT-badge.pdf}
    \end{minipage}
    \qquad
    \begin{minipage}[c][2.35cm][c]{9cm}
        \xingkai
        \ifbuct@bachelor
            \ziju{0.1}\hspace*{0.8\ccwd}\zihao{-0}
        \else
            \ziju{-0.02}\zihao{0}
        \fi
        {北京化工大学}
    \end{minipage}
    \ifbuct@bachelor\vspace{12bp}\else\vspace{18bp}\fi
    \begin{center}
        \ifbuct@bachelor
            \ziju{0.15}\xbsong\zihao{-0}\CJKfamily+{}{%
            \punctstyle{banjiao}毕业设计（论文）% (论文)
            }
        \else%
            %\ziju{-0.05}
            \dbsong\fontsize{38bp}{60bp}\selectfont
            \ifbuct@master{硕}\else{博}\fi{}士研究生学位论文
        \fi
    \end{center}
    \ifbuct@bachelor
            \setlength{\TPHorizModule}{1cm}
            \setlength{\TPVertModule}{1cm}
            \begin{textblock}{0}(0,10)
                \noindent%
                \tikz[line width=1.2pt] \draw (0,0) -- (21,0) (0,0.2) -- (21,0.2);
            \end{textblock}
            \vspace{72bp}
            \begin{center}
                \xeCJKsetup{
                    underline = {
                        skip      = false,
                        thickness = 1.4pt,
                    }
                }
                \renewcommand{\arraystretch}{2}
                \begin{tabular}{%
                        >{\zihao{-2}\xbsong}l
                        >{\zihao{3}\bfseries}l
                }
                    题\hspace{\ccwd}目  & \buct@title@ul{\buct@ChineseTitleLineA}\\
                    \ifthenelse{\equal{\buct@ChineseTitleLineB}{}}{\relax}{
                                        & \buct@title@ul{\buct@ChineseTitleLineB}\\
                    }
                \end{tabular}
                \vskip144bp\zihao{3}
                \begin{tabular}{
                        >{\begin{CJKfilltwosides}[b]{4\ccwd}\xbsong}r%
                            <{\end{CJKfilltwosides}}%
                        @{}>{\enspace\zihao{4}\bfseries}l%
                        <{\vspace{.2em}}%
                    }
                    专业     & \buct@major@ul{\buct@major}\\
                    学生   & \buct@major@ul{\buct@author}\\
                    指导教师 & \buct@major@ul{\buct@supervisor}\\
                \end{tabular}
            \end{center}
            \vfill{%
                \begin{center}%
                    \buct@format@date{\@zhdate}%
                \end{center}%
            }
    \else
        \vspace{76bp}
        \begin{center}
            \xeCJKsetup{
                underline = {
                    skip      = false,
                    thickness = 1.2pt,
                }
            }
            \renewcommand{\arraystretch}{2.7}
            \begin{tabular}{
                >{\fontsize{20}{36}\selectfont\begin{CJKfilltwosides}[b]{4\ccwd}\sffamily\bfseries}r%
                <{\end{CJKfilltwosides}}%
                @{}>{\enspace\zihao{3}\bfseries}l%
                <{\vspace{.2em}}%
            }
                题目     & \buct@title@ul{\buct@ChineseTitleLineA}\\
                \ifthenelse{\equal{\buct@ChineseTitleLineB}{}}{\relax}{
                                        & \buct@title@ul{\buct@ChineseTitleLineB}\\
                }
                专业     & \buct@title@ul{\zihao{4}\buct@major}\\
                研究生   & \buct@title@ul{\zihao{4}\buct@author}\\
                指导教师 & \buct@title@ul{\zihao{4}\buct@supervisor}\\
            \end{tabular}
        \end{center}
        \vfill{%
            \begin{center}%
                \buct@format@date{\@zhdate}%
            \end{center}%
        }
    \fi
}
\NewDocumentCommand{\makecover}{ o }{%
    \hypertarget{cover}{}
    \pdfbookmark{封面}{cover}
    \IfNoValueTF{#1}{
        \IfFontExistsTF{FZXiaoBiaoSong-B05S}{%
            \newCJKfontfamily[xbsong] \xbsong {FZXiaoBiaoSong-B05S}
            \newCJKfontfamily[dbsong] \dbsong {FZDaBiaoSong-B06S}
            \newCJKfontfamily[xingkai]\xingkai{STXingkai}
            \newCJKfontfamily[zhkai]  \zhkai  {KaiTi} [AutoFakeBold]
            \buct@makecover
        }{
            \cleardoublepage
        }

    }{%
        \includepdf[pages=-]{#1}
    }
\restoregeometry
}
\newcommand{\buct@pdfmark}[2]{%
    \hypertarget{#2}{}
    \pdfbookmark{#1}{#2}
}
\newcommand{\buct@makedeclare}{
    \ifbuct@bachelor
        \centerline{\buct@dcl@titlefont\buct@dcl@title}\par\vspace{1em}
        \leftline{\buct@dcl@ideclarefont\buct@dcl@ideclare}%
        \buct@dcl@text
        \par\vspace{2em}\hfill{\buct@dcl@sign}
    \else{
        \thispagestyle{empty}
        \linespread{1.5534}
        \setlength{\parskip}{15pt}
        \centerline{\buct@dcl@titlefont\buct@dcl@title}
        \par\indent\buct@dcl@textfont\buct@dcl@text
        \par\indent\buct@sign@author\\[30pt]
        \centerline{\buct@auth@titlefont\buct@auth@title}
        \par\indent\buct@auth@textfont\buct@auth@text
        \par\indent\buct@sign@author
        \par\indent\buct@sign@supervisor
    }\fi
    \clearpage\normalsize
}
\NewDocumentCommand{\makedeclare}{ o }{%
    \buct@pdfmark{\ifbuct@bachelor\buct@dcl@title\else\buct@dcl@pdf\fi}{declare}
    \IfNoValueTF{#1}{\buct@makedeclare}{%
        \includepdf[pages=-]{#1}
    }
}
\ifbuct@bachelor
    \NewDocumentEnvironment{taskbook}{ s }{%
        \cleardoublepage%
        \buct@pdfmark{\buct@task@pdf}{taskbook}%
        \section*{\buct@task@title}%
        \IfBooleanTF{#1}{\pagestyle{empty}}{}%
    }{\clearpage}
    \NewDocumentCommand{\buct@ul}{ o m }{\underline{\makebox[#1][c]{#2}}}
    \NewDocumentCommand\taskinfo{ s }{%
        \noindent%
        \begin{minipage}{\textwidth}%
            \punctstyle{plain}\linespread{1.94}%
                \buct@task@ChineseTitle\buct@ul[27em]{\buct@ChineseTitle}\\[3pt]
            \IfBooleanTF{#1}{% less lines break
                \buct@task@school\buct@ul[10em]{\buct@school}\quad
                \buct@task@major\buct@ul[10em]{\buct@major}\quad
                \buct@task@class\buct@ul[5em]{\buct@class}\\[3pt]
                \buct@task@student\buct@ul[5em]{\buct@author}\quad
                \buct@task@supervisor\buct@ul[6em]{\buct@supervisor}\quad
                \buct@task@msupervisor\buct@ul[4em]{\buct@msupervisor}%
            }{% more lines break
                \buct@task@school\buct@ul[15em]{\buct@school}\qquad
                \buct@task@major\buct@ul[13em]{\buct@major}\\[3pt]
                \buct@task@class\buct@ul[15em]{\buct@class}\qquad
                \buct@task@student\buct@ul[13em]{\buct@author}\\[3pt]
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
\newenvironment{bibenumerate}{%
    \begin{enumerate}[label={[\arabic*]},leftmargin=3em]
}{\end{enumerate}}
\ifbuct@bachelor
    \newenvironment{cabstract}{%
        \cleardoublepage
        \buct@pdfmark{\buct@cabstract@title}{cabstract}
        \begin{center}
            \buct@abs@titfont\buct@ChineseTitle
            \vskip22pt
            \buct@abs@infofont\buct@author\quad%
            \buct@class\quad\buct@studentid\quad%
            \buct@supervisor@title\buct@supervisor%
            \vskip22pt
            \buct@abs@absfont\buct@cabstract@title
        \end{center}\par\vspace{18pt}
    }{\vskip1em\noindent\buct@keywordsfont\buct@ChineseKeywords@title\buct@ChineseKeywords}
\else
    \newenvironment{cabstract}{%
        \cleardoublepage
        \buct@pdfmark{\buct@cabstract@title}{cabstract}\markboth{\buct@cabstract@title}{\buct@cabstract@title}
        \begin{center}
            \buct@abs@titfont\buct@ChineseTitle
            \vskip24pt
            \buct@abs@absfont\buct@cabstract@title
        \end{center}\par\vspace{12pt}
        \buct@abs@textfont
    }{\vskip24pt%
    \noindent\buct@keywords@titfont\buct@ChineseKeywords@title\buct@keywords@font\buct@ChineseKeywords}
\fi
\ifbuct@bachelor
    \newenvironment{eabstract}{%
        \cleardoublepage%
        \buct@pdfmark{\buct@eabstract@title}{abstracten}
        \begin{center}
            \buct@abs@titfonten\buct@EnglishTitle\vskip22pt
            \buct@abs@absfonten\buct@eabstract@title
        \end{center}
        \par\vspace{22pt}
    }{\vskip1em\noindent\buct@keywordsfonten \buct@EnglishKeywords@title\buct@EnglishKeywords}
\else
    \newenvironment{eabstract}{%
        \cleardoublepage%
        \buct@pdfmark{\buct@eabstract@title}{eabstract}\markboth{\buct@eabstract@title}{\buct@eabstract@title}
            \begin{center}
                \setlength{\leftskip}{3em plus 1em minus .5em}
                \setlength{\rightskip}{3em plus 1em minus .5em}
                \buct@abs@titfonten\buct@EnglishTitle\vskip76pt
                \buct@abs@absfonten\buct@eabstract@title
            \end{center}\par\vspace{40pt}
        \buct@abs@textfont
    }{\vskip48pt%
    \noindent\buct@keywords@titfonten\buct@EnglishKeywords@title\buct@keywords@fonten\buct@EnglishKeywords}
\fi
\setcounter{secnumdepth}{3}
\ifbuct@bachelor
    \setcounter{tocdepth}{2}
\else
    \setcounter{tocdepth}{3}
\fi
\renewcommand\tableofcontents{%
    \cleardoublepage
    \pdfbookmark{\contentsname}{toc}%
    \chapter*{\buct@toc@tocfont\buct@content@title}%
    \ifbuct@bachelor\relax\else\markboth{\buct@content@title}{\buct@content@title}\fi
    \@starttoc{toc}
}
\ifbuct@bachelor\relax\else
    \newcommand\tableofcontentsEN{%
        \cleardoublepage
        \pdfbookmark{\buct@econtentsname}{toce}%
        \chapter*{%
            \em\buct@econtentsname%
            \ifbuct@bachelor\relax\else\markboth{\buct@econtentsname}{\buct@econtentsname}\fi%
        }%
        \@starttoc{toce}
    }
    \newcommand\buct@addengcontents[3]{%
        \addcontentsline{toce}{#1}{\protect\numberline{#3\@nameuse{the#1}}#2}
    }
    \newcommand\echapter[1]{\buct@addengcontents{chapter}{#1}{\buct@toce@chapfont{}\buct@econtent@chapter}}
    \newcommand\esection[1]{\buct@addengcontents{section}{#1}{}}
    \newcommand\esubsection[1]{\buct@addengcontents{subsection}{#1}{}}
    \newcommand\esubsubsection[1]{\buct@addengcontents{subsubsection}{#1}{}}
    \NewDocumentCommand{\bichapter}{ o m m }{\chapter[#1]{#2}\echapter{#3}}
    \NewDocumentCommand{\bisection}{ o m m }{\section[#1]{#2}\esection{#3}}
    \NewDocumentCommand{\bisubsection}{ o m m }{\subsection[#1]{#2}\esubsection{#3}}
    \NewDocumentCommand{\bisubsubsection}{ o m m }{\subsubsection[#1]{#2}\esubsubsection{#3}}
\fi
\ifbuct@bachelor
    \titlecontents{chapter}[0em]
        {\buct@toc@chapfont\vspace{3pt}}
        {\thecontentslabel\quad}{}
        {\titlerule*[.4em]{$\cdot$}\bfseries\contentspage}
    \titlecontents{section}[2.5em]
        {\buct@toc@secfont\vspace{-3pt}}
        {\thecontentslabel\quad}{}
        {\titlerule*[.5em]{$\cdot$}\contentspage}
    \titlecontents{subsection}[4em]
        {\buct@toc@ssecfont\vspace{-3pt}}
        {\thecontentslabel\quad}{}
        {\titlerule*[1em]{$\cdot$}\contentspage}
\else
    \titlecontents{chapter}[0em]
        {\buct@toc@chapfont\vspace{3pt}}
        {\thecontentslabel\quad}{}
        {\titlerule*[.25em]{$\cdot$}\bfseries\contentspage}
    \titlecontents{section}[2.25em]
        {\buct@toc@secfont\vspace{-3pt}}
        {\thecontentslabel\quad}{}
        {\titlerule*[.5em]{$\cdot$}\contentspage}
    \titlecontents{subsection}[5em]
        {\buct@toc@ssecfont\vspace{-3pt}}
        {\thecontentslabel\quad}{}
        {\titlerule*[1em]{$\cdot$}\contentspage}
    \titlecontents{subsubsection}[8.5em]
        {\buct@toc@sssecfont\vspace{-3pt}}
        {\thecontentslabel\quad}{}
        {\titlerule*[1em]{$\cdot$}\contentspage}
\fi
\renewcommand{\bibsection}{
    \chapter*{\bibname}
    \addcontentsline{toc}{chapter}{\bibname}
    \ifbuct@bachelor\relax\else
        \addcontentsline{toce}{chapter}{\buct@toce@chapfont\buct@ebib@title}
        \markboth{\bibname}{\bibname}
    \fi
}
\ifbuct@bachelor
    \newcommand{\dcaption}[1]{%
        \caption{#1}\addcontentsline{toc}{subsection}{%
            \hspace{2.5em}\buct@dfigurename~\thefigure\hspace{1em}{#1}%
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
        \buct@pdfmark{\buct@dfigure@content@title}{dfigure}%
        \buct@listof{dfigure}{\buct@dfigure@content@title}
    }
\fi
\newenvironment{foreword}{%
    \cleardoublepage
    \buct@pdfmark{\buct@foreword@title}{foreword}
    \chapter*{\buct@foreword@title}
}{}
\ifbuct@bachelor
    \linespread{1.5221}
\else
    \linespread{1.3837}
\fi
\ifbuct@bachelor
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
            beforeskip  = 3 pt,
            afterskip   = 3 pt,
            aftername   = \hspace{0.5em},
            indent      = 0.5em,
        },
    }
\else
    \ctexset{%
        chapter = {%
            name        = {第,章},
            number      = \chinese{chapter},
            format      = \buct@chapfont,
            beforeskip  = 12 pt,
            afterskip   = 46 pt,
            fixskip     = true,
            aftername   = \qquad,
        },
        section = {%
            format      = \buct@secfont,
            aftername   = \quad,
            beforeskip  = 26 pt,
            afterskip   = 28 pt,
            fixskip     = true,
        },
        subsection = {%
            format      = \buct@ssecfont,
            beforeskip  = 3 pt,
            afterskip   = 3 pt,
        },
        subsubsection = {%
            format      = \buct@sssecfont,
            beforeskip  = 3 pt,
            afterskip   = 3 pt,
        },
    }
\fi
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
\newtheoremstyle{buctthm}%  name
{3pt}%                      Space above
{3pt}%                      Space below
{}%                         Body font
{}%                         Indent amount
{\bfseries}%                Theorem head font
{:}%                        Punctuation after theorem head
{.5em}%                     Space after theorem head
{}%                         Theorem head spec
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
    range-phrase = {\,$\sim$\,},
}
\ifbuct@bachelor
    \newfloat{dfigure}{htbp}{lodf}[chapter]
    \floatname{dfigure}{\buct@dfigurename}
\else
    \DeclareCaptionOption{english}[]{
        \renewcommand\figurename{\buct@bifigure@name}
        \renewcommand\tablename{\buct@bitable@name}
    }
    \captionsetup[bi-second]{english}
\fi
\ifbuct@bachelor\relax\else
    \AtBeginEnvironment{tabular}{\buct@floatfont}
    \AtBeginEnvironment{tabularx}{\buct@floatfont}
\fi
\let\oldlongtable\longtable
\let\endoldlongtable\endlongtable
\def\longtable{\zihao{5}\oldlongtable}
\AtEndEnvironment{longtable}{\normalsize}
\graphicspath{{figure/}}
\renewcommand{\captionfont}{\buct@float@captionfont}
\renewcommand{\captionlabelfont}{\buct@float@labelfont}
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
    \ifbuct@bachelor
        \renewcommand{\thedfigure}{\thechapter-\arabic{dfigure}}
        \renewcommand{\theequation}{\thechapter-\arabic{equation}}
    \else
        \renewcommand{\eqref}[1]{\equationname~\textup{(\ref{#1})}}
        \renewcommand{\theequation}{\thechapter-\arabic{equation}}
    \fi
    \renewcommand{\thelstlisting}{\thechapter-\arabic{lstlisting}}
}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\ifbuct@bachelor\relax\else
    \xpatchcmd{\dotfill}{.44em}{.3em}{}{}
    \renewenvironment{equation}{
        \@beginparpenalty\predisplaypenalty
        \@endparpenalty\postdisplaypenalty
        \refstepcounter{equation}%
        \trivlist \item[]\leavevmode
        \hb@xt@\linewidth\bgroup $\m@th% $
        \displaystyle\hfill}
        {$\;\dotfill % $
        \displaywidth\linewidth\hbox{\@eqnnum}%
        \egroup
        \endtrivlist}
\fi
\lstset{%
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
\ifbuct@bachelor
    \newenvironment{conclusion}{%
        \chapter*{\buct@concl@title}
        \addcontentsline{toc}{chapter}{\buct@concl@title}
    }{}
    \newenvironment{translation}{%
        \chapter*{\buct@trans@title}
        \addcontentsline{toc}{chapter}{\buct@trans@title}
    }{}
\else
    \g@addto@macro\appendix{\def\buct@econtent@chapter{Appendix~}}
    \newenvironment{achievements}{%
        \cleardoublepage
        \chapter*{\buct@achi@title}
        \markboth{\buct@achi@title}{\buct@achi@title}
        \addcontentsline{toc}{chapter}{\buct@achi@title}
        \addcontentsline{toce}{chapter}{\buct@toce@chapfont\buct@eachi@title}
    }{}
    \newenvironment{resume}{%
        \cleardoublepage
        \chapter*{\buct@resu@title}
        \markboth{\buct@resu@title}{\buct@resu@title}
        \addcontentsline{toc}{chapter}{\buct@resu@title}
        \addcontentsline{toce}{chapter}{\buct@toce@chapfont\buct@eresu@title}
    }{}
\fi
\newenvironment{acknowledgement}{%
    \chapter*{\buct@ack@title}
    \ifbuct@bachelor\relax\else
        \markboth{\buct@ack@title}{\buct@ack@title}
        \addcontentsline{toce}{chapter}{\buct@toce@chapfont\buct@eack@title}
    \fi
    \addcontentsline{toc}{chapter}{\buct@ack@title}
}{}
\NewDocumentEnvironment{denotation}{ O{10cm} +b }{%
    \cleardoublepage
    \chapter*{\buct@deno@title}%
    \ifbuct@bachelor
        \addcontentsline{toc}{chapter}{\buct@deno@title}
    \else
        \buct@pdfmark{\buct@deno@title}{denotation}
        \markboth{\buct@deno@title}{\buct@deno@title}
    \fi
    \vspace{-1em}%
    \begin{oldlongtable}[c]{l@{\extracolsep{3em}}p{#1}}
        #2
}{\end{oldlongtable}}
\ifbuct@bachelor
    \setlength{\bibsep}{3pt}
\else
    \setlength{\bibsep}{0pt}
    \renewcommand\bibfont{\linespread{1.5814}\zihao{5}}
\fi
\renewcommand{\emph}[1]{\textbf{#1}}
\renewcommand{\em}{\bfsong}
\newcommand{\buct@ftntcircled}[1]{%
    \lower 0.15em\hbox{%
        \tikz\draw (0pt, 0pt) circle (0.4 em) node {#1};%
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
\ifbuct@debugger
    \AtBeginDocument{\linenumbers}
\fi
\endinput
%%
%% End of file `buctthesis.cls'.
