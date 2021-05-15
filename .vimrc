set encoding=utf-8
set fileencodings=utf-8,cp932,utf-16le,utf-16,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
set nobackup
set nowritebackup
set noswapfile
set noundofile
set shortmess+=I
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed
set history=500
set hlsearch
" set imdisable
set autoindent
set smartindent
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

nmap <Esc><Esc> :nohlsearch<CR><Esc>
let mapleader = "\<Space>"
" noremap <S-h>   ^
" noremap <S-j>   }
" noremap <S-k>   {
" noremap <S-l>   $
" 現在日時を入力
" nmap <C-o><C-o> <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S ==========")<CR><CR>
" nmap <C-o><C-o> <ESC>i<C-r>=strftime("%Y-%m-%d")<CR><CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e .<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>q :q<CR>
" タブのダイレクト選択
nnoremap <Leader>1 :tabn 1<CR>
nnoremap <Leader>2 :tabn 2<CR>
nnoremap <Leader>3 :tabn 3<CR>
nnoremap <Leader>4 :tabn 4<CR>
nnoremap <Leader>5 :tabn 5<CR>
nnoremap <Leader>6 :tabn 6<CR>
nnoremap <Leader>7 :tabn 7<CR>
nnoremap <Leader>8 :tabn 8<CR>
nnoremap <Leader>9 :tabn 9<CR>
" タブへの移動
nnoremap <Leader>l gt<CR>
nnoremap <Leader>h gT<CR>
" バッファの切り替え
nnoremap <Leader>j :bn<CR>
nnoremap <Leader>k :bp<CR>

" --------------------------------------------------
" <Space>cd で編集ファイルのカレントディレクトリへと移動
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>


" vim7.4ではプラグインを使わない
if v:version < 740
    syntax enable
    finish
endif


" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/dotfiles/.vim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


colorscheme molokai
syntax enable

set vb t_vb=
set noerrorbells

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

autocmd! FileType markdown hi! def link markdownItalic LineNr
autocmd! FileType markdown hi! def link markdownError LineNr

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

autocmd BufRead,BufNewFile JenkinsFile setfiletype groovy
autocmd BufRead,BufNewFile DockerFile setfiletype ruby
autocmd BufRead,BufNewFile VagrantFile setfiletype ruby

autocmd FileType html setlocal sw=2 sts=2 ts=2 et
autocmd FileType css setlocal sw=2 sts=2 ts=2 et
autocmd FileType scss setlocal sw=2 sts=2 ts=2 et
autocmd FileType sass setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType json setlocal sw=2 sts=2 ts=2 et
autocmd FileType js setlocal sw=2 sts=2 ts=2 et
autocmd FileType ruby setlocal sw=2 sts=2 ts=2 et
autocmd FileType python setlocal sw=4 sts=4 ts=4 et
" grep + Quickfix
autocmd QuickFixCmdPost *grep* cwindow

