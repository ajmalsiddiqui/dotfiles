" My configuration file for vim

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

" Enable autointendation
set autoindent
" Tries to do the right thing based on the program/filetype
set smartindent

set nobackup       "no backup files
set noswapfile     "no swap files

" Use the unnamed register for manipulating the clipboard
" This means that cutting and yanking uses the clipboard, and so does pasting
set clipboard^=unnamedplus

" Status line
set statusline=%f      " path to the file
set statusline+=\ -\   " seperator (<space>-<space>)
set statusline+=%y     " filetype
set statusline+=%=     " switch to the right side
set statusline+=%l     " current line number
set statusline+=/      " seperator
set statusline+=%L     " total lines

" Always show statusline
" Setting this to 0 disables it
" 1 - Only when more than 1 window is present
" 2 - always
set laststatus=2

" Set updatetime (default of 4000 ms is too much)
" Note that this affects the frequency with which vim updates the swapfile
" This improves experience with gitgutter
set updatetime=200


" Show hidden files (dotfiles) by default in NERDTree
let NERDTreeShowHidden=1


" mappings
" To make sure that space doesn't have any mappings beforehand (and to disable the default function of space)
nnoremap <space> <nop>
let mapleader = "\<space>"

" Note - the "nore" in nnoremap stands for "no-recursive" which prevents the mappings from executing recursively

" edit the vimrc on demand
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" toggle nerdtree on/off. make life cleaner.
nnoremap <leader>f :NERDTreeToggle<cr>

nnoremap H ^
nnoremap L $

" Split windows
nnoremap <leader>s :split<cr><C-w>w
nnoremap <leader>v :vsplit<cr><C-w>w
" Shortcuts to switch between windows
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h

" Move between tabs quickly
nnoremap <tab> :tabn<cr>
nnoremap <s-tab> :tabp<cr>

" to unlearn the stupid habit of pressing <esc> again and again :3
inoremap <esc> <nop>
inoremap jk <esc>

" Quick way to add a TODO xD
inoremap td <space>TODO<space>


" when you use the autocmd command, vim essentially adds a new command
" even if the exact same command was already defined, it isn't overwritten
" so every time you source your .vimrc, the number of duplicate autocmd commands increases by 1
" by grouping autocommands into an augroup, and using autocmd! (to clear the autocmds inside the group)
" we ensure that there are no duplicates
augroup nerdtree
  autocmd!
  "Close vim automatically if NERDTree is the only window left
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
augroup end

augroup filetype_python
  autocmd!
  " Comment string. Used by commentary.
  autocmd filetype python setlocal commentstring=#\ %s
augroup end

