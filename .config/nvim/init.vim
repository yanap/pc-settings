let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_repo_dir)

" プラグイン管理.
call dein#add('Shougo/dein.vim')
" 非同期処理.
call dein#add('Shougo/vimproc', {'build': 'make'})
" 入力補完.
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
" ステータスライン.
call dein#add('itchyny/lightline.vim')
" 統合ユーザインターフェース.
call dein#add('Shougo/unite.vim')
" colorscheme preview.
call dein#add('ujihisa/unite-colorscheme')
" colorscheme jelly beans.
call dein#add('nanotech/jellybeans.vim')
" 文法確認.
call dein#add('scrooloose/syntastic')
" vimからshellを起動する.
call dein#add('Shougo/vimshell.vim')
" 対になる文字を自動で入れたり消したり.
call dein#add('jiangmiao/auto-pairs')
" go 開発用.
call dein#add('fatih/vim-go')

call  dein#end()

if dein#check_install()
  call dein#install()
end

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" colorshema
syntax on
colorscheme jellybeans

" ステータスライン 設定
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ }

" Syntastic Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim basic settings
" タイトルをウインドウ枠に表示する
set title
" インサートモード、ビジュアルモードの状態表示をしない
set noshowmode
" 行番号をつける
set number
" 自動インデント
set autoindent
" TrueColor対応
set termguicolors

" Enable filetype plugins
filetype plugin on
