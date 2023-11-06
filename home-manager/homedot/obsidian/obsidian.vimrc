let mapleader=","

set clipboard+=unnamed
set ignorecase
set incsearch
set number
set relativenumber
set smartcase

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader><space> @q
noremap <leader>rn :set relativenumber!<CR>
noremap <leader>sp <C-w>s
noremap <leader>vs <C-w>v
noremap <leader>x :x<CR>
noremap Y y$

exmap liveGrep obcommand obsidian-another-quick-switcher:grep
nmap gl :liveGrep
