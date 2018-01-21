#!/bin/sh

# User以下の設定ファイルのリンクを生成
# Windows : C:\Users\%USERNAME%\AppData\Roaming\Code\User
# keybindings.json, settings.json, snippets etc...
ln -s "`pwd`/User" ${HOME}/.config/Code/

# 拡張機能のインストール
filename="./extension-list"
cat ${filename} | while read line
do
  code --install-extension ${line}
done

# 自作拡張機能のリンクを生成
# Windows : C:\Users\%USERNAME%\.vscode\extensions\
for extension in `\find extensions/* -maxdepth 0`; do
  unlink "${HOME}/.vscode/${extension}"
  ln -s "`pwd`/${extension}" ${HOME}/.vscode/${extension}
done