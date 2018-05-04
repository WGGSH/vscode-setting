@echo off
rem User�ȉ��̐ݒ�t�@�C���̃����N�𐶐�
rem Linux : $HOME/.config/Code/User
rem keybindings.json, settings.json, snippets etc...
mklink /D C:\Users\%USERNAME%\AppData\Roaming\Code\User %CD%\User

rem Markdown Preview Enhanced��css�t�@�C���ւ̃����N��ǋL
echo @import url("C:/Users/%USERNAME%/markdown_pdf.css");>>"C:\Users\%USERNAME%\.mume\style.less"

rem CSS�t�@�C���̃����N�𐶐�
mklink /H  C:\Users\%USERNAME%\markdown_pdf.css %CD%\markdown_pdf.css

rem �g���@�\�̃����N�𐶐�
rem Linux : $HOME/.vscode/extensions/
for /f "usebackq" %%i in (`dir /B %CD%\extensions\*`) do (
  mklink /D C:\Users\%USERNAME%\.vscode\extensions\%%i %CD%\extensions\%%i
)

rem �g���@�\�̃C���X�g�[��
for /f %%a in (extension-list) do (
	rem: echo %%a
  code --install-extension %%a
)