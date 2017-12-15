" setting
set number
set title
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set wrapscan
set cursorline
set scrolloff=10
set confirm
set hidden
set nobackup
set noswapfile
set hlsearch
set incsearch
set ignorecase
set nowrapscan
set mouse=a
set wildmenu wildmode=list:longest,full
set fenc=utf-8
set laststatus=2
set ruler
set showcmd
set list
set listchars=trail:.
set clipboard+=unnamed
set clipboard=unnamedplus
set clipboard+=autoselect
set wildmenu
set history=1000
set backspace=indent,eol,start
syntax on
set syntax=markdown
set incsearch

autocmd QuickFixCmdPost *grep* cwindow

" escをjjに
inoremap <silent> jj <ESC>

" sキー封印
nnoremap s <Nop>

" window移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

" 論理移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" 端に移動
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

" インデント
nnoremap == gg=G''

" window分割 shortcut key
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

" 新規tab shortcut key
nnoremap st :<C-u>tabnew<CR>

" 画面を閉じる
nnoremap sq :<C-u>q<CR>

" 検索結果を画面中央に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

" 強制保存
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" htmlの閉じタグ補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

" clipboardからのペースト時のインデント崩れの防止
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
