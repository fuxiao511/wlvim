call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugin'
" wl add
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFind' }
Plug 'zivyangll/git-blame.vim'
Plug 'vim-scripts/taglist.vim'

Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
call plug#end()

" Key Bindings: {{{
let mapleader = "'"
let maplocalleader = ","


" git command
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>
" -- git command on current file 
fun! GitCommand(command) 
  silent! !clear 
  exec "!git " . a:command . " %" 
endfun 
" -- git diff for current file 
map <leader>d :call GitCommand("diff") <CR> 
" -- git log for current file 
map <leader>l :call GitCommand("log -p") <CR> 
" -- git blame for current file 
map <leader>a :call GitCommand("blame") <CR> 


" taglist
let g:Tlist_WinWidth = 32
let g:Tlist_Use_Right_Window = 0
let g:Tlist_Auto_Update = 1
let g:Tlist_Process_File_Always = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
nmap <Leader>t :TlistToggle<cr>

" nerdtree
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 30
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeQuitOnOpen = 1
nmap <Leader>f :NERDTreeToggle<CR>
nmap <Leader>F :NERDTreeFind<CR>


" cscope
if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif
nmap <localleader>s :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <localleader>g :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <localleader>c :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <localleader>t :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <localleader>e :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <localleader>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <localleader>i :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <localleader>d :cs find d <C-R>=expand("<cword>")<cr><cr>


" mark.vim use default mappings
"        xmap <unique> <Leader>m <Plug>MarkSet
"        nmap <unique> <Leader>n <Plug>MarkClear
"        nmap <unique> <Leader>/ <Plug>MarkSearchAnyNext
"        nmap <unique> <Leader>? <Plug>MarkSearchAnyPrev

" vim
set hlsearch
