set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=UTF-8
set noshowmode
set shortmess+=F  " to get rid of the file name displayed in the command line bar
set laststatus=0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Vundle Plugin Manager

call vundle#begin()
" Vundle 
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
" Vundle
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

Plugin 'jiangmiao/auto-pairs'
Plugin 'myusuf3/numbers.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'andymass/vim-matchup'
Plugin 'bling/vim-bufferline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'preservim/nerdtree'
Plugin 'mhinz/vim-startify'
Plugin 'christoomey/vim-system-copy'
" or Plug 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

Plugin 'doums/darcula'
Plugin 'leafgarland/typescript-vim'
" You can install your plugin here

call vundle#end()            " required
filetype plugin indent on    " required

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

let g:system_copy#copy_command='xclip -sel clipboard'

" 主題設定
syntax enable
colorscheme darcula
let g:airline_theme='darcula'
let g:airline_powerline_fonts = 1

set termguicolors

" 設定結束
nnoremap <F6> :NumbersToggle<CR>
set ts=2
set sts=2
let g:loaded_matchit = 1
autocmd VimEnter * NumbersToggle
" TabLine設定
let g:bufferline_echo = 0
  autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0 
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tabs_label = '☀ bloodnigttw '
let g:airline#extensions#tabline#left_sep = ''
nnoremap <F9> :enew<CR>
nnoremap <F10> :tabnew<CR>
nnoremap <F7> :bp<CR>
nnoremap <F8> :bn<CR>
nnoremap <F12> :bd<CR>

nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
" 設定結束
" coc.nvim 的設定
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

set updatetime=300

set shortmess+=c

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>



function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" coc.nvim 設定結束


imap <C-w> <Plug>(coc-snippets-expand)
vmap <c> <Plug>(coc-snippets-select)

" 使用 <C-l> 跳轉到下一個佔位符，coc.nvim 預設值
let g:coc_snippet_next = '<C-l>'
" 使用 <C-k> 要跳轉到上一個佔位符，coc.nvim 預設值
let g:coc_snippet_prev = '<C-h>'


" 當沒有檔案開啟時 自動開啟 nerdtree



autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif





map <C-t> :NERDTreeToggle<CR>

"  _    _ _   ____  _                 _       _       _     _   _
" | |  | (_) |  _ \| |               | |     (_)     | |   | | | |
" | |__| |_  | |_) | | ___   ___   __| |_ __  _  __ _| |__ | |_| |___      __ 
" |  __  | | |  _ <| |/ _ \ / _ \ / _` | '_ \| |/ _` | '_ \| __| __\ \ /\ / /
" | |  | | | | |_) | | (_) | (_) | (_| | | | | | (_| | | | | |_| |_ \ V  V /
" |_|  |_|_| |____/|_|\___/ \___/ \__,_|_| |_|_|\__, |_| |_|\__|\__| \_/\_/__  __
"              /\     | |  | |               | | __/ |                    |  \/  |
"  ______     /  \    | |__| | __ _ _ __   __| ||___/___  _ __ ___   ___  | \  / | __ _ _ __
" |______|   / /\ \   |  __  |/ _` | '_ \ / _` / __|/ _ \| '_ ` _ \ / _ \ | |\/| |/ _` | '_ \
"           / ____ \  | |  | | (_| | | | | (_| \__ \ (_) | | | | | |  __/ | |  | | (_| | | | |
"          /_/    \_\ |_|  |_|\__,_|_| |_|\__,_|___/\___/|_| |_| |_|\___| |_|  |_|\__,_|_| |_|

let s:header = [
      \ '',
      \ '       _    _ _   ____  _                 _       _       _     _   _',
      \ '      | |  | (_) |  _ \| |               | |     (_)     | |   | | | |',
      \ '      | |__| |_  | |_) | | ___   ___   __| |_ __  _  __ _| |__ | |_| |___      __',
      \ '      |  __  | | |  _ <| |/ _ \ / _ \ / _` |  _ \| |/ _` |  _ \| __| __\ \ /\ / /',
      \ '      | |  | | | | |_) | | (_) | (_) | (_| | | | | | (_| | | | | |_| |_ \ V  V /',
      \ '      |_|  |_|_| |____/|_|\___/ \___/ \__,_|_| |_|_|\__, |_| |_|\__|\__| \_/\_/__  __',
      \ '                   /\     | |  | |               | | __/ |                    |  \/  |',
      \ '       ______     /  \    | |__| | __ _ _ __   __| ||___/___  _ __ ___   ___  | \  / | __ _ _ __',
			\ '      |______|   / /\ \   |  __  |/ _` |  _ \ / _` / __|/ _ \|  _ ` _ \ / _ \ | |\/| |/ _` |  _ \',
			\ '                / ____ \  | |  | | (_| | | | | (_| \__ \ (_) | | | | | |  __/ | |  | | (_| | | | |',
			\ '               /_/    \_\ |_|  |_|\__,_|_| |_|\__,_|___/\___/|_| |_| |_|\___| |_|  |_|\__,_|_| |_|',
			\ '',
			\ '',
			\ '',
      \ ]

let g:startify_custom_header = s:header

let g:startify_custom_footer = [
												\ '',
												\ '',
												\ '',
												\ '    HBVIM (HandsomeBoyVIM) Made by bloodnighttw.',
												\ '    Github:    https://github.com/bloodnighttw',
												\ '    FACEBOOK:  https://facebook.com/bloodnigttw.main',
												\ '    Twitter:   https://twitter.com/bloodnighttw',
												\]

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

set viminfo='100,n$HOME/.vim/files/info/viminfo
set shiftwidth=2
