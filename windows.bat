@echo off
rem User�ȉ��̐ݒ�t�@�C���̃����N�𐶐�
rem Linux : $HOME/.config/Code/User
rem keybindings.json, settings.json, snippets etc...
mklink /D C:\Users\%USERNAME%\AppData\Roaming\Code\User %CD%\User

rem �g���@�\�̃C���X�g�[��
for /f %%a in (extension-list) do (
  code --install-extension %%a
)

rem �g���@�\�̃����N�𐶐�
rem Linux : $HOME/.vscode/extensions/
for /f "usebackq" %%i in (`dir /B %CD%\extensions\*`) do (
  mklink /D C:\Users\%USERNAME%\.vscode\extensions\%%i %CD%\extensions\%%i
)
