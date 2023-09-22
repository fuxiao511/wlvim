call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
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
"Plug 'rdnetto/ycm-generator'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'valloric/youcompleteme'
"Plug 'rizsotto/bear'
" does not work in centos7
"Plug 'vim-scripts/AutoComplPop'
"Plug 'vim-scripts/OmniCppComplete'
call plug#end()

" Key Bindings: {{{
let mapleader = "'"
let maplocalleader = ","

" git command
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

" -- git command on current file 
fun! GitCommand(command) 
  silent! !clear
  echo %
  exec "!git " . a:command . " %" 
endfun

fun! GitShow()
    silent! !clear
    let l:blank = ' '
    let l:file = expand('%')
    let l:line = line('.')
    let l:gb = gitblame#commit_summary(l:file, l:line)
    let git_blame = split(system('cd "$(dirname "'.file.'")"; git --no-pager blame "$(basename "'.file.'")" -L "$(basename "'.line.'")",+1 --porcelain'), "\n")
	
    let commit_hash = matchstr( git_blame[0], '^\^*\zs\S\+' )
    if commit_hash =~# '^0\+$'
        " not committed yet
        echo 'Not Committed yet'
    endif
	
    "echo commit_hash
    exec "!git show " . commit_hash . " "

endfun
" -- git diff for current file 
map <leader>d :call GitCommand("diff") <CR> 
" -- git log for current file 
map <leader>l :call GitCommand("log -p ") <CR> 
map <leader>s :call GitShow() <CR> 
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
let g:Tlist_Close_On_Select = 1
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
" tab = 4 whitspace
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 用空格键来开关折叠


" Uncomment the following to have Vim jump to the last position when       
" reopening a file                                                         
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" youcompleteme
"set completeopt=menu,menuone
set completeopt=menu
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-n>'
let g:ycm_auto_hover=''
noremap <c-n> <NOP>
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
