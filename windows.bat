@echo off
rem User以下の設定ファイルのリンクを生成
rem Linux : $HOME/.config/Code/User
rem keybindings.json, settings.json, snippets etc...
mklink /D C:\Users\%USERNAME%\AppData\Roaming\Code\User %CD%\User

rem Markdown Preview Enhancedのcssファイルへのリンクを追記
echo @import url("C:/Users/%USERNAME%/markdown_pdf.css");>>"C:\Users\%USERNAME%\.mume\style.less"

rem CSSファイルのリンクを生成
mklink /H  C:\Users\%USERNAME%\markdown_pdf.css %CD%\markdown_pdf.css

rem 拡張機能のリンクを生成
rem Linux : $HOME/.vscode/extensions/
for /f "usebackq" %%i in (`dir /B %CD%\extensions\*`) do (
  mklink /D C:\Users\%USERNAME%\.vscode\extensions\%%i %CD%\extensions\%%i
)

rem 拡張機能のインストール
for /f %%a in (extension-list) do (
	rem: echo %%a
  code --install-extension %%a
)