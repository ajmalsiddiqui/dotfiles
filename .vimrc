"My configuration file for vim

" The molokai colourscheme should be installed via the vim.bootstrap.exclude.sh file
colorscheme molokai

syntax on	          "syntax highlighting

set number          "turns on line numbering
set relativenumber  "turns on relative numbering

"Tabs of width 2, convert tabs to spaces
set tabstop=2 
set shiftwidth=2
set expandtab 

set encoding=utf-8  "default text encoding is UTF-8

set cursorline  "highlight current line (vim shows a horizontal line under the current line)

set incsearch "search as characters are entered"
set hlsearch  "highlight matches"

autocmd vimenter * NERDTree "Start NERDTree whenever vim is fired up

"Close vim automatically if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

" Status line
:set statusline=%f      " path to the file
:set statusline+=\ -\   " seperator (<space>-<space>)
:set statusline+=%y     " filetype
:set statusline+=%=     " switch to the right side
:set statusline+=%l     " current line number
:set statusline+=/      " seperator
:set statusline+=%l     " total lines

" mappings
let mapleader = "\""

" edit the vimrc on demand
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" and source the vimrc when needed
nnoremap <leader>sv :source $MYVIMRC<cr>

" toggle nerdtree on/off. make life cleaner.
nnoremap <leader>f :NERDTreeToggle<cr>

nnoremap H ^
nnoremap L $

" to unlearn the stupid habit of pressing <esc> again and again :3
inoremap <esc> <nop>
inoremap jk <esc>

" when you use the autocmd command, vim essentially adds a new command
" even if the exact same command was already defined, it isn't overwritten
" so every time you source your .vimrc, the number of duplicate autocmd commands increases by 1
" by grouping autocommands into an augroup, and using autocmd! (to clear the autocmds inside the group)
" we ensure that there are no duplicates
augroup filetype_python
  autocmd!
  " comment out a single line of python code in normal mode
  autocmd filetype python nnoremap <leader>c ^i#<esc>
  " select stuff in visual block mode only and comment it all out
  autocmd filetype python vnoremap <leader>c i#<esc><esc>
augroup end

