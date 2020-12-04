# BUCTthesis

[![BUCTthesis](https://img.shields.io/badge/BUCTthesis-LaTeX-blue)](https://github.com/Miracle0565/BUCTthesis)
[![GitHub license](https://img.shields.io/github/license/Miracle0565/BUCTthesis)](https://github.com/Miracle0565/BUCTthesis/blob/master/LICENSE)

BUCTthesis is a LaTeX writting template for BUCT undergraduate thesis.

本项目为北京化工大学本科毕业设计（论文）的 LaTeX 模板。

## 快速使用

1. 安装 TeX 发行版，推荐使用 TeX Live。
2. [在这里下载](https://github.com/Miracle0565/BUCTthesis/releases)模板最新发行版的压缩文件。
3. 为检查编译环境，请于全英文路径下解压缩，并对 `master` 文件夹中的  `main.tex` 文件执行 `latexmk` 或 `xelatex -> bibtex -> xelatex -> xelatex` 的全编译。如果无报错、无警告则环境合适。
4. 阅读本模板的说明文档 `buctthesis.pdf`，该文档简要地说明了模板的使用方法。
5. `blank` 文件夹为空白模板，适合全新写作。在 `main.tex` 中填写作者信息；在 `chapter` 目录下编写内容并在 `main.tex` 调用；在 `figure` 和 `code` 目录下分别保存插图和源代码，以方便写作时调用；在 `thesisbib.bib` 文件中插入参考文献条目。
6. 按第 3 步执行全编译。

## 注意事项

- 北京化工大学教务处仅提供[《北京化工大学本科毕业环节工作规定》](https://jiaowuchu.buct.edu.cn/2019/0222/c515a22047/page.htm)和[《本科生毕业设计（论文）撰写规范》](https://jiaowuchu.buct.edu.cn/2018/1009/c515a22046/page.htm)两份文件以规范论文写作，而未对本模板做任何测试或授权。模板作者自当尽力，但限于软件等各种因素，由本模板生成的文档可能仍与要求有所出入。所以使用本模板类造成（包括但不限于）论文审核不通过等问题作者不负责，请使用时慎酌。

- 上述两份文件之间有出入之处，以及有少许笔误之处和歧义之处。模板作如下统一：
    - 二者间以后者（ Word 文档）为准，如图、表编号中的分隔符使用 `-` ；
    - 标题 `诚信申明` 改为 `诚信声明`；
    - 章节编号 `均以罗马数字表示顺序` 改为 `均以阿拉伯数字表示顺序`；
    - 对章节 `标题加黑` ，“加黑”一词理解为 `使用（伪）粗体` 而非 `标题为黑体`；

- 模板仅在 TeX Live 2020 顺利编译，可能不兼容于低版本。**不支持** CTeX 套装。
- 模板仅在 Win10 系统下做编译测试，故不能保证在其他系统或平台上正确。

## 提问

关于模板的任何问题或新功能需求欢迎提交 [GitHub Issues](https://github.com/Miracle0565/BUCTthesis/issues)。

## 开源许可

本项目基于  [LaTeX Project Public License](http://www.latex-project.org/lppl.txt)（版本 1.3c 或更高）开源于 [GitHub](https://github.com/Miracle0565/BUCTthesis)。同时为了方便国内用户，在 [Gitee](https://gitee.com/Miracle0565/BUCTthesis) 建有代码的镜像。
