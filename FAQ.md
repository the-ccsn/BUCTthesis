# 常见问题
Frequently Asked Questions

## 开题报告中对阿司匹林的大段描述是怎么回事？我在仓库里根本找不到文本，应该去哪里删？

这是因为在 `buctproposal.sty` 中调用了 [`zhlipsum`](https://github.com/CTeX-org/zhlipsum) 宏包，
并在文档 `proposal.tex` 中使用了由它提供的 `\zhlipsum` 命令，来生成所谓的“乱数假文”用以测试文档。
（[这是该宏包在 CTAN 上的链接](https://ctan.org/pkg/zhlipsum)）

如果需要删除文本，直接在 `.tex` 文件中删除或注释含有 `\zhlipsum` 的命令即可。

## 在Overleaf使用的时候遇到 `Emergency stop.` 报错

报错示例：

```
<read *> 
         
l.31 \RequireXeTeX
                  
*** (cannot \read from terminal in nonstop modes)
```

处理建议：

出现这种情况是因为Overleaf默认的编译器是pdfLaTeX而非XeLaTeX，您可以在Overleaf左上角“Menu/菜单”中设置默认编译器为2022版本的XeLaTeX

## 在Overleaf使用的时候遇到 `Package fontspec Error: The font "SimSun" cannot be found.` 报错

报错示例：

```
For immediate help type H <return>.
 ...                                              
                                                  
l.101   }
          
Here is how much of TeX's memory you used:
```

这是因为SimSun并不包含在Overleaf的环境中（详细的支持列表可见[Overleaf帮助文档](https://www.overleaf.com/learn/latex/Questions/Which_OTF_or_TTF_fonts_are_supported_via_fontspec%3F#Chinese)）。相关讨论可见：

* https://tex.stackexchange.com/questions/685154/how-to-import-chinese-font-simsun-on-overleaf
* https://www.cnblogs.com/shenxiaolin/p/12207345.html
* https://github.com/CasperVector/pkuthss/issues/28
* https://github.com/latexstudio/CUMCMThesis/issues/26

建议在本地Windows计算机运行
