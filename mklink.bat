@REM https://qiita.com/okamos/items/7f5461814e8ed8916870
REM 管理者権限で実行してください
PAUSE

mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
mklink %HOMEPATH%"\.gvimrc" %HOMEPATH%"\dotfiles\.gvimrc"
@REM mklink /D %HOMEPATH%"\.vim\ftdetect" %HOMEPATH%"\dotfiles\ftdetect"
@REM mklink /D %HOMEPATH%"\.vim\indent" %HOMEPATH%"\dotfiles\indent"
@REM mklink /D %HOMEPATH%"\.vim\colors" %HOMEPATH%"\dotfiles\colors"
