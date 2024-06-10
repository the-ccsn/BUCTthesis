# 常见问题
Frequently Asked Questions

## 关于本模板

### 开题报告中对阿司匹林的大段描述是怎么回事？我在仓库里根本找不到文本，应该去哪里删？

这是因为在 `buctproposal.sty` 中调用了 [`zhlipsum`](https://github.com/CTeX-org/zhlipsum) 宏包，
并在文档 `proposal.tex` 中使用了由它提供的 `\zhlipsum` 命令，来生成所谓的“乱数假文”用以测试文档。
（[这是该宏包在 CTAN 上的链接](https://ctan.org/pkg/zhlipsum)）

如果需要删除文本，直接在 `.tex` 文件中删除或注释含有 `\zhlipsum` 的命令即可。

### 我用LaTeX写了毕业论文，答辩用的PPT还要重新排版，能不能复用论文里面的LaTeX代码内容？

可以。北京化工大学风格的beamer模板不止一个，可见：

* https://github.com/Miracle0565/BUCT-Beamer-Theme
* https://github.com/Livioni/Beamer-Temlate-for-BUCT (在Overleaf可直接使用)

需注意，使用[北京化工大学视觉识别系统](https://www.buct.edu.cn/xywh_11378/list.htm#)需注意其版权归北京化工大学所有，属于专有资源，而非依照本项目的LPPL-1.3c协议授权。

## Overleaf 相关

### 在Overleaf使用的时候遇到 `Emergency stop.` 报错

报错示例：

```
<read *> 
         
l.31 \RequireXeTeX
                  
*** (cannot \read from terminal in nonstop modes)
```

处理建议：

出现这种情况是因为Overleaf默认的编译器是pdfLaTeX而非XeLaTeX，您可以在Overleaf左上角“Menu/菜单”中设置默认编译器为2022版本的XeLaTeX

### 在Overleaf使用的时候遇到 `Package fontspec Error: The font "SimSun" cannot be found.` 报错

报错示例：

```
For immediate help type H <return>.
 ...                                              
                                                  
l.101   }
          
Here is how much of TeX's memory you used:
```

这是因为SimSun并不包含在Overleaf的环境中（详细的支持列表可见[Overleaf帮助文档](https://www.overleaf.com/learn/latex/Questions/Which_OTF_or_TTF_fonts_are_supported_via_fontspec%3F#Chinese)）。

本模板默认指定了fontset=windows，您可以在main.tex中切换为fandol来解决此问题。

## 合规性相关

### 我发现文中有很多文字是标红的，打印出来效果非常糟糕(以至于答辩老师批评我)；我想关掉它们，怎么办？

您可在.tex文件的开头处修改，取消submit的注释。

```
\documentclass[
	type = bachelor,	% bachelor | master | doctor
	submit,
	%openany,			% openany | openright(default)
	fontset = windows,  % fandol | windows (normal)
]{buctthesis}
```

### 我发现文中每个章节前都有一个空白页，而且不能靠打印丢纸解决，因为页码在这些空白页是连续的(以至于答辩老师批评我)；我想删掉它们，怎么办？

您可在.tex文件的开头处修改，取消openany的注释。

```
\documentclass[
	type = bachelor,	% bachelor | master | doctor
	%submit,
	openany,			% openany | openright(default)
	fontset = windows,  % fandol | windows (normal)
]{buctthesis}
```

### 我发现参考文献的序号是悬挂缩进的，而我所在的学院（如信息科学与技术学院）给的模板中明确规定参考文献只需要首行缩进两个字符

您可在 `buctthesis.cls` 中插入特定的代码以临时解决这一问题。

相关教程可参见 [BUCTthesis 参考文献控制在序号首行缩进](https://telegra.ph/BUCTthesis-%E5%8F%82%E8%80%83%E6%96%87%E7%8C%AE%E6%8E%A7%E5%88%B6%E5%9C%A8%E5%BA%8F%E5%8F%B7%E9%A6%96%E8%A1%8C%E7%BC%A9%E8%BF%9B-05-08) 一文，其原理可参见 [BUCTthesis 中参考文献样式调整背后的原理](https://telegra.ph/BUCTthesis-%E4%B8%AD%E5%8F%82%E8%80%83%E6%96%87%E7%8C%AE%E6%A0%B7%E5%BC%8F%E8%B0%83%E6%95%B4%E8%83%8C%E5%90%8E%E7%9A%84%E5%8E%9F%E7%90%86-05-08) 一文
