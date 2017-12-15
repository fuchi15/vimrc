if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" editorconfig
NeoBundle 'editorconfig/editorconfig-vim'

" vimのwindowサイズ調整
NeoBundle 'simeji/winresizer'
let g:winresizer_start_key = '<C-T>'

" vim上でgitの差分
NeoBundle 'airblade/vim-gitgutter'
" stauts line
NeoBundle 'itchyny/lightline.vim'

" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-l> gt
map <C-h> gT

" Unite.vim導入
NeoBundle 'Shougo/unite.vim'
" Unite.vim setting
" prefix keyの設定
nmap <Space> [unite]
" insertモードで起動
let g:unite_enable_start_insert=1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1
" キーマップ
"スペースキーとaキーでカレントディレクトリを表示
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"スペースキーとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
"新規ファイル作成
noremap :uff :<C-u>UniteWithBufferDir file file/new -buffer-name=file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" 括弧を自動で入れる
NeoBundle 'Townk/vim-autoclose'

" vim上でファイル名検索
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'tacahiroy/ctrlp-funky'
" let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100'
let g:ctrlp_show_hidden = 0
" let g:ctrlp_types = ['fil']
" let g:ctrlp_extensions = ['funky']
" let g:ctrlp_funky_matchtype = 'path'

" ファイル名検索にagを使う
NeoBundle 'rking/ag.vim'
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --hidden -g ""'
endif

" ag.vim
NeoBundle 'rking/ag.vim'

" tcomment
NeoBundle 'tomtom/tcomment_vim'

" plantuml
NeoBundle "aklt/plantuml-syntax"
let g:plantuml_executable_script = "~/.dotfile/plantuml"

" Railsのプラグイン
NeoBundle 'tpope/vim-rails'
" slimのsyntax
NeoBundle 'slim-template/vim-slim'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" カラースキーム
NeoBundle 'vim-scripts/twilight'

" なんかタグ強調してくれるやつ
NeoBundle 'valloric/matchtagalways'

" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1

" Reactのsyntax
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

" Vueのsyntax
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'

autocmd BufNewFile,BufRead *.vue set filetype=html

" emmet-vim
NeoBundle 'mattn/emmet-vim'

" coffee-scriptのsyntax
NeoBundle 'kchmck/vim-coffee-script'

" scalaのsyntax
NeoBundle 'derekwyatt/vim-scala'
au BufRead,BufNewFile *.scala  set filetype=scala


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
