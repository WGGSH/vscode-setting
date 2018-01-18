@echo off
:: User以下の設定ファイルのリンクを生成
:: Linux : $HOME/.config/Code/User
:: keybindings.json, settings.json, snippets etc...
mklink /D C:\Users\%USERNAME%\AppData\Roaming\Code\User %CD%\User

:: 拡張機能のリンクを生成
:: Linux : $HOME/.vscode/extensions/
for /f "usebackq" %%i in (`dir /B %CD%\extensions\*`) do (
	mklink /D C:\Users\%USERNAME%\.vscode\extensions\%%i %CD%\extensions\%%i
)
