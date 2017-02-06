# README
[![Build Status](https://travis-ci.org/sfc-rg/yokou-template.svg?branch=master)](https://travis-ci.org/sfc-rg/yokou-template)
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

## Travis CIの連携方法
[Travis-CI](https://travis-ci.org/)を使うとPushやPull-reqの際に自動でビルドして、
PDFをgh-pagesにアップロードしてくれるようになります。

以下の設定を行うと利用することが可能です

1. travis-ciでアカウント作成  
[Travis-CI](https://travis-ci.org/)にアクセスしてアカウントを作成する。

2. travisユーティリティのインストール  
gitレポジトリディレクトリで以下のコマンドを実行  
`$ sudo gem install travis`  
`$ travis login --auto`  
`$ travis enable`

3. deploy用SSH鍵の生成
    1. `.travis`ディレクトリに移動
    2. 既存deploy鍵の削除  
    `git rm github_deploy_key.enc`
    3. ssh鍵を生成する  
    `ssh-keygen -t ed25519 -f github_deploy_key -N '' -C <Githubの登録メールアドレス>`

4. 公開鍵をGithubのdeploy keyとして登録  
[この辺](http://qiita.com/master-of-sugar/items/a9892879f6e9cb9f3c97)を参考にgithub_deploy_key.pubを登録する。  
その際Read/Writeの権限を与えること

5. travisに秘密鍵を暗号化してtravisに登録  
    1. `$ travis encrypt-file github_deploy_key`  
    この際、以下のようなメッセージが表示される  
    `openssl aes-256-cbc -K $encrypted_1f38e5143912_key -iv $encrypted_1f38e5143912_iv -in github_deploy_key.enc -out github_deploy_key -d`  
    2. そこに含まれる`$encrypted_1f38e5143912_key`と`$encrypted_1f38e5143912_iv`を`.travis.yml`の`deploy`にある`set-up-ssh`行に追加する  
    例: `$(npm bin)/set-up-ssh --key "$encrypted_1f38e5143912_key" --iv "$encrypted_1f38e5143912_iv"  --path-encrypted-key ".travis/github_deploy_key.enc"`

6. GitHubの情報を登録  
commit時に用いるユーザ名などをtravisに登録する  
    1. 既存コードを削除  
    36行〜38行を削除
    2. `travis encrypt`を用いて暗号化  
    例: `travis encrypt --add -r "nunnun/yokou-template" GH_USER_EMAIL="hiro@skyblue.me.uk" GH_USER_NAME="Hirotaka Nakajima"`
