@echo off
rem User以下の設定ファイルのリンクを生成
rem Linux : $HOME/.config/Code/User
rem keybindings.json, settings.json, snippets etc...
mklink /D C:\Users\%USERNAME%\AppData\Roaming\Code\User %CD%\User

rem 拡張機能のインストール
for /f %%a in (extension-list) do (
  code --install-extension %%a
)

rem 拡張機能のリンクを生成
rem Linux : $HOME/.vscode/extensions/
for /f "usebackq" %%i in (`dir /B %CD%\extensions\*`) do (
  mklink /D C:\Users\%USERNAME%\.vscode\extensions\%%i %CD%\extensions\%%i
)
