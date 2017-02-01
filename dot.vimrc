if &diff
	" diff mode
	set diffopt+=iwhite
	" from stackoverflow.com/questions/4830171/getting-gvims-vimdiff-to-ignore-case
	set diffexpr=MyDiff()
	function MyDiff()
		let opt = ""
		if &diffopt =~ "icase"
			let opt = opt . "-i "
		endif
		if &diffopt =~ "iwhite"
			let opt = opt . "--ignore-all-space "
		endif
		silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new . " > " . v:fname_out
	endfunction
endif
set nocompatible  " We don't want vi compatibility.

set background=light
set tags=tags;/

let g:netrw_keepdir=0

"au BufRead,BufNewFile * lcd %:p:h
"au BufEnter           * lcd %:p:h

au FileType c,cc,cpp,h,hh,hpp,java,objc,objcpp :set autoindent expandtab cin shiftwidth=4 softtabstop=4 cino +=(0
au FileType html,htm,jsp :set autoindent expandtab cin shiftwidth=2 softtabstop=2 cino +=(0
au FileType xml :set autoindent expandtab cin shiftwidth=2 softtabstop=2
au FileType perl :set autoindent expandtab cin shiftwidth=2 softtabstop=2
au FileType make :set noautoindent noexpandtab shiftwidth=4 tabstop=4 softtabstop=0

" Ruby stuff
"
au FileType ruby,eruby :set autoindent expandtab cin shiftwidth=2 softtabstop=2 cino +=(0
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim

set fileformats=unix,dos

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
" Show $ at end of line and trailing space as ~
set lcs=eol:$,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
colorscheme peachpuff  " kind of a gross scheme but at least it is readable

" Fuzze match
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70

map <leader>b :FuzzyFinderBuffer<CR>
map <leader>f :FuzzyFinderFile<CR>
map <leader>t :FuzzyFinderTag<CR>

set complete=.,w,b,u,t,i

" Recommendations from http://items.sjbach.com/319/configuring-vim-right
"
set hidden

nnoremap ' `
nnoremap ` '

let mapleader = ","

set history=1000

set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase

set title

set scrolloff=3

" Backups & Files
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set ruler
set statusline=%<%f%h%m%r%=%03b\ 0x%02B\ \ %04l,%03c\ %P

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on
 
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

nmap <silent> <leader>n :silent :nohlsearch<CR>

set listchars=tab:>-,trail:.,eol:$
nmap <silent> <leader>s :set nolist!<CR>

set shortmess=atI
" END Recommendations from http://items.sjbach.com/319/configuring-vim-right
"

"
" Recommendations from vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
"
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
