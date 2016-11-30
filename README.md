# README
* 慶応義塾大学湘南藤沢キャンパス 村井・徳田合同研究室の発表における予稿テンプレートです。
* 元のデータは[こちら](https://gist.github.com/ntddk/f842cabe4298a2f988b9)より拝借
    - thanks to gomachan :)

## つかいかた
1. `resume.tex`をいじる
2. `make`
4. `make clean`

## Macでの.styファイルの読み込み方
TexShopを使っている諸兄のために.styファイルの読ませ方について指南する(デフォルトではこれでつまりコンパイルできない)
TexShopが読み込むよう適切な位置に.styファイルを配置しよう
```
mkdir ~/Library/texmf/tex
mv resume.sty ~/Library/texmf/tex
```

