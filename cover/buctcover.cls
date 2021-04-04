%%
%% This is file `buctcover.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% buctthesis.dtx  (with options: `cover')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2019-2021 by Miracle0565
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
\ProvidesClass{buctcover}[2021/03/28 Cover Maker for BUCTthesis]
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
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\PassOptionsToPackage{quiet}{xeCJK}
\LoadClass[zihao=-4]{ctexbook}
\ifbuct@bachelor%
    \ClassError{buctcover}{%
        type `bachelor' is unavailable. \MessageBreak%
        type = [ master | doctor ]%
    }{}\else
    \ifbuct@master\relax\else
        \ifbuct@doctor\relax\else
            \ClassError{buctthesis}{%
                Specified thesis type is obligatory: \MessageBreak%
                type = [ master | doctor ]%
            }{}
\fi\fi\fi
\newcommand{\coversetup}[1]{\kvsetkeys{buct}{#1}}
\DeclareStringOption[学号未定义]{studentid}
\DeclareStringOption[题目首行未定义]{titleA}
\DeclareStringOption[题目次行未定义]{titleB}
\DeclareStringOption[专业未定义]{major}
\DeclareStringOption[作者未定义]{author}
\DeclareStringOption[导师未定义]{supervisor}
\DeclareStringOption[\the\year-\two@digits{\month}-\two@digits{\day}]{date}
\RequirePackage[a4paper,nomarginpar,
    top = 2.1cm, bottom = 2.2cm, left = 2cm, right = 2cm,
    headheight = 0cm, footskip = 0cm
]{geometry}
\RequirePackage{array,graphicx,hyperref}
\pagestyle{empty}
\xeCJKsetup{EmboldenFactor=2.3}
\setCJKsansfont{SimHei}[AutoFakeBold]
\newCJKfontfamily[xingkai]\xingkai{STXingkai}
\newCJKfontfamily[zhkai]  \zhkai  {KaiTi} [AutoFakeBold]
\newCJKfontfamily[xbsong] \xbsong {FZXiaoBiaoSong-B05S}
\newCJKfontfamily[dbsong] \dbsong {FZDaBiaoSong-B06S}
\newcommand\buct@format@date[1]{%
    \edef\buct@@date{\buct@date}%
    \def\buct@@process@date##1-##2-##3\@nil{%
        #1{##1}{##2}{##3}%
    }%
    \expandafter\buct@@process@date\buct@@date\@nil
}
\newcommand\@zhdate[3]{%
    \Large\bfseries\zhkai\ziju{.1}%
    日\hspace{1.5\ccwd}期：\zhdigits{#1}年\zhnumber{#2}月\zhnumber{#3}日%
}
\newcommand{\buct@makecover}{%
    \begin{table}[h]
        \renewcommand{\arraystretch}{1.3}
        \raggedleft\large
        \begin{tabular}{l@{}l}
            \xbsong 单位代码 & ：\CJKfamily+{zhsong}\mbox{10010}\\
            \xbsong 学\hspace{2\ccwd}号 & ：\CJKfamily+{zhsong}\mbox{\buct@studentid}\\
        \end{tabular}
    \end{table}
    \vspace{26bp}
    \begin{minipage}[c][][c]{2.35cm}
        \includegraphics[width = 2.35cm]{BUCT-badge.pdf}
    \end{minipage}
    \qquad
    \begin{minipage}[c][2.35cm][c]{9cm}
        \ziju{-0.02}\xingkai\zihao{0}{北京化工大学}
    \end{minipage}
    \vspace{18bp}
    \begin{center}
        % \ziju{-0.05}
        {\dbsong\fontsize{38bp}{60bp}\selectfont
        \ifbuct@master{硕}\else{博}\fi{}士研究生学位论文}
    \end{center}
        \vspace{76bp}
    \begin{center}
        \fontsize{20}{36}\selectfont
        \xeCJKsetup{
            underline = {
                skip      = false,
                thickness = 1.2pt,
            }
        }
        \begin{tabular}{
            >{\begin{CJKfilltwosides}[b]{4\ccwd}\sffamily\bfseries}r%
            <{\end{CJKfilltwosides}}%
            @{}l%
            @{}>{\zihao{3}\bfseries}l%
            <{\vspace{.2em}}%
        }
            题目     &：           & \CJKunderline{\makebox[13em][l]{\buct@titleA}}\\
                    &\phantom{：} & \CJKunderline{\makebox[13em][l]{\buct@titleB}}\\
            专业     &：           & \CJKunderline{\makebox[13em][l]{\buct@major}}\\
            研究生   &：           & \CJKunderline{\makebox[13em][l]{\buct@author}}\\
            指导教师 &：           & \CJKunderline{\makebox[13em][l]{\buct@supervisor}}\\
        \end{tabular}
    \end{center}
    \vfill{%
        \begin{center}%
            \buct@format@date{\@zhdate}%
        \end{center}%
    }
}
\ifbuct@bachelor\relax\else
    \NewDocumentCommand{\makecover}{ o }{%
    \hypertarget{cover}{}
    \pdfbookmark{封面}{cover}
        \IfNoValueTF{#1}{\buct@makecover}{%
            \includepdf[pages=-]{#1}
        }
    }
\fi
\endinput
%%
%% End of file `buctcover.cls'.
