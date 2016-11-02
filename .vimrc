"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttymouse=xterm2 "Fix mouse dragging in tmux
set mouse=a
set ignorecase "Ignore case when searching
set smartcase "Case-sensitive if search contains an uppercase character
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

"Highlight current line
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

"Highlight current column
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn
set cursorcolumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
set gfn=Monospace\ 10
set shell=/bin/bash

set background=dark

set encoding=utf8
try
    lang en_GB
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

match Todo /\s\+$/ "Highlight whitespaces
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" Copy and Paste using the System Clipboard
map <C-c> "+y<CR>

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/home/{{ user }}/',"~/", "g")
    return curdir
endfunction

""""""""""""""""""""""""""""""
" => Fuzzy finder
""""""""""""""""""""""""""""""
try
    call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
    map <leader>t :FufCWD **/<CR>
catch
endtry
""""""""""""""""""""""""""""""
" => Omnicompete
""""""""""""""""""""""""""""""
filetype plugin on
"set ofu=syntaxcomplete#Complete
au FileType php set omnifunc=phpcomplete#CompletePHP

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'
set grepprg=/bin/grep\ -nH


""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
" Map Nerd File Explorer
"map <F5> :NERDTreeToggle<CR>
"map <F5> :NERDTreeFind<CR>
"let mapleader = "\\"
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeKeepTreeInNewTab=1
"let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""
" => Twig
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.twig set syntax=htmljinja

""""""""""""""""""""""""""""""
" => Handlebars
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

""""""""""""""""""""""""""""""
" => ctags
""""""""""""""""""""""""""""""
:noremap <Leader>t :!ctags-refresh<CR>

""""""""""""""""""""""""""""""
" => pathogen.vim
""""""""""""""""""""""""""""""
execute pathogen#infect()
