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


" when you use the autocmd command, vim essentially adds a new command
" even if the exact same command was already defined, it isn't overwritten
" so every time you source your .vimrc, the number of duplicate autocmd commands increases by 1
" by grouping autocommands into an augroup, and using autocmd! (to clear the autocmds inside the group)
" we ensure that there are no duplicates
augroup nerdtree
  autocmd!
  "Start NERDTree whenever vim is fired up
  autocmd vimenter * NERDTree 

  "Close vim automatically if NERDTree is the only window left
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
augroup end

augroup filetype_python
  autocmd!
  " comment out a single line of python code in normal mode
  autocmd filetype python nnoremap <leader>c ^i#<esc>
  " select stuff in visual block mode only and comment it all out
  autocmd filetype python vnoremap <leader>c i#<esc><esc>
augroup end

