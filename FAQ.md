# 常见问题
Frequency Asked Question

## 开题报告中对阿司匹林的大段描述是怎么回事？我在仓库里根本找不到文本，应该去哪里删？

这是因为这里使用了\zhlipsum提供的乱数假文，它在 https://ctan.org/pkg/zhlipsum 处提供
您可以将\item后的内容改为您的实际文本以测试
如果您不需要使用乱数假文，可以删除 https://github.com/the-ccsn/BUCTthesis/blob/5306faaa82f9950f6e85ebeb34c0e772cd49fd0e/demo/bachelor/mycfg.sty#L7 中的调用
