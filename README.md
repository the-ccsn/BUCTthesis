# BUCTthesis

[![BUCTthesis](https://img.shields.io/badge/BUCTthesis-LaTeX-blue)](https://github.com/the-ccsn/BUCTthesis)
[![GitHub license](https://img.shields.io/github/license/the-ccsn/BUCTthesis)](https://github.com/the-ccsn/BUCTthesis/blob/master/LICENSE)

## BUCTthesis in a nutshell
BUCTthesis is a LaTeX writting template package for Beijing University of Chemical Technology,
supporting bachelor, master and doctor theses.

You can [download](https://github.com/the-ccsn/BUCTthesis/releases) this package from GitHub Releases,
and the latest released version is strongly recommended. As this package is mainly provided for
Chinese users, the following of this file and the manual documents are written in Chinese only.

This file may be distributed and/or modified under
the conditions of the LaTeX Project Public License,
either version 1.3c of this license or (at your option)
any later version. The latest version of this license
is in:

http://www.latex-project.org/lppl.txt

and version 1.3c or later is part of all distributions
of LaTeX version 1999/12/01 or later.


## BUCTthesis 是什么？

BUCTthesis （**B**eijing **U**niversity of **C**hemical **T**echnology LaTeX **Thesis** template）是北京化工大学学位论文的 LaTeX 模板，包括本科毕业设计（论文）与硕士、博士研究生学位论文。

## 快速使用

1. 安装 TeX 发行版，推荐使用 TeX Live。
2. [在这里下载](https://github.com/the-ccsn/BUCTthesis/releases) 模板最新发行版的压缩文件。
3. 解压缩后，可在 `demo` 文件夹中找到本科、硕博两种论文类型所对应的示例文件夹；**将所选论文类型文件夹中的所有内容移动至模板的根目录**。（例如，对本科而言，需将 `demo/bachelor` 中的所有内容复制或移动到根目录， `demo` 文件夹中的剩余内容可删除。）
4. 阅读本模板的说明文档 `buctthesis.pdf`，该文档简要地说明了模板的使用方法。
5. 相比于重建文件，直接在示例文件上修改会更加方便：
   - `main.tex` 用于定义作者与论文信息，并组织论文结构；
   - `mycfg.sty` 用于自定义命令等；
   - `thesisbib.bib` 文件中插入参考文献条目；
   - `chapter` 文件夹用于存放各部分内容，并在 `main.tex` 调用；
   - `figure` 和 `code` 文件夹下分别保存插图和源代码，以方便写作时调用；
6. 对 `main.tex` 文件执行 `latexmk` 或 `xelatex -> bibtex -> xelatex -> xelatex` 的全编译。

## 注意事项

- 北京化工大学教务处与研究生院仅提供了写作规范（见下）而**未对本模板做任何测试或授权**。模板作者自当尽力，但限于软件等各种因素，由本模板生成的文档可能仍与要求有所出入。所以使用本模板类造成（包括但不限于）论文审核不通过等问题作者不负责，请使用时慎酌。
- 模板在 TeX Live 2020 及更新版本、[Overleaf](https://www.overleaf.com/) 上可顺利编译，可能不兼容于低版本。**不支持** CTeX 套装。
- 论文封面相关：
   - 学校会统一印制论文封面，而其中包括标题和作者等的内容需要用笔填写。但为保证论文的完整性，本模板对其进行了仿制，故与实际相比可能有少许差别；
   - 封面使用的方正系列字体需要自行安装，字体清单参见说明文档 `buctthesis.pdf`。

## 写作规范

- 本科：[《北京化工大学本科毕业环节工作规定》](https://jiaowuchu.buct.edu.cn/2019/0222/c515a22047/page.htm)、[《本科生毕业设计（论文）撰写规范》](https://jiaowuchu.buct.edu.cn/2018/1009/c515a22046/page.htm)
- 硕博：[《北京化工大学研究生学位论文撰写规范（修订）》](https://xxgk.buct.edu.cn/2017/1107/c2835a39437/page.htm)
- 参考文献（非校方链接）：[GB/T 7714—2015 信息与文献 参考文献著录规则](http://www.cessp.org.cn/uploads/1/file/public/201607/20160708142456_8mqgu0dpgk.pdf)

## 《规范》勘误

### 本科

学校教务处提供了两份文件，而二者之间有出入之处，以及有少许笔误之处和歧义之处。模板作如下统一：

- 二者间以后者（ Word 文档）为准，如图、表编号中的分隔符使用 `-`（ U+002D ）；
- 标题 `诚信申明` 改为 `诚信声明`；
- 章节编号 `均以罗马数字表示顺序` 改为 `均以阿拉伯数字表示顺序`；
- 对章节 `标题加黑` ，“加黑”一词理解为“使用（伪）粗体”而非“标题为黑体”。

### 硕博

- 英文摘要中的 `KEY WORDS：`，模板将字母后的全角冒号 `：`（ U+FF1A ）改为半角冒号 `:`（ U+003A ）；
- 正文、参考文献条目的 `行间距20磅` 改为 `行距20磅`。

## 提问

关于模板的任何问题或新功能需求，欢迎提交 [GitHub Issues](https://github.com/the-ccsn/BUCTthesis/issues)。

## 开源许可

本项目的代码部分基于  [LaTeX Project Public License](http://www.latex-project.org/lppl.txt)（版本 1.3c 或更高）开源于 [GitHub](https://github.com/the-ccsn/BUCTthesis) 。同时为了方便国内用户，在 [Gitee](https://gitee.com/Miracle0565/BUCTthesis) 建有代码的镜像。

## 迁移

原有的 [本科开题报告模板](https://github.com/the-ccsn/buct-proposal) 目前暂存于本仓库根目录下文件夹内。
