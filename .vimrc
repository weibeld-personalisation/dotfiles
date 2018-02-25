" ~/.vimrc
"
" Note: split lines with \ at the beginning of the new line.
"
" Daniel Weibel <daniel.weibel@unifr.ch> May 2015
"------------------------------------------------------------------------------"

execute pathogen#infect()

" No backwards compatibility with vi (only pure Vim commands, which is better)
set nocompatible

" Extend surround plugin with LaTeX command (usage example: ysiwc textbf)
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

" Prevent parenthesis matching plugin from being loaded
let loaded_matchparen=1

" Use line numbers
set number

" Display line number and column number in status bar
set ruler

" Highlight search matches
set hlsearch

" Highlicht first matches of search while typing pattern
set incsearch


" Open file explorer in a horizontal split window
nnoremap S :Sex<CR>

"Open file explorer in current window
nnoremap E :Explore<CR>

" Submode for resizing windows. Requires plugin https://github.com/kana/vim-submode
" Enlarge width of current window
call submode#enter_with('resize-window', 'n', '', '<C-w>L', '5<C-w>>')
call submode#map('resize-window', 'n', '', 'L', '5<C-w>>')
" Reduce width of current window
call submode#enter_with('resize-window', 'n', '', '<C-w>H', '5<C-w><')
call submode#map('resize-window', 'n', '', 'H', '5<C-w><')
" Enlarge height of current window
call submode#enter_with('resize-window', 'n', '', '<C-w>K', '5<C-w>+')
call submode#map('resize-window', 'n', '', 'K', '5<C-w>+')
" Reduce height of current window
call submode#enter_with('resize-window', 'n', '', '<C-w>J', '5<C-w>-')
call submode#map('resize-window', 'n', '', 'J', '5<C-w>-')
let g:submode_timeout = 0
let g:submode_keep_leaving_key = 1

" Toggle spell checking
nnoremap <leader>s :set spell!<CR>

" Change current line to title case
nnoremap <leader>t :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>:nohlsearch<CR>

" Set spelling language(s)
set spelllang=en

vnoremap J 10j
vnoremap K 10k
vnoremap <C-j> 5j
vnoremap <C-k> 5k

" Navigate up and down in steps of multiple lines
nnoremap J 10j
nnoremap K 10k
nnoremap <C-j> 5j
nnoremap <C-k> 5k

" Remap 'join lines', which is J by default
nnoremap Z :join<CR>

" Reload ~/.vimrc
nnoremap <leader>r :so $MYVIMRC<CR>

" Do not move cursor one position back when exiting insert mode
" autocmd InsertEnter * let CursorColumnI = col('.')
" autocmd CursorMovedI * let CursorColumnI = col('.')
" autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Use Enter to insert an empty line below
nnoremap <CR> o<Esc>

" O (big-O) to open a line two lines below
nnoremap O o<CR>

" Change the cursor to a block in normal mode and bar in insert mode
" (problem: changes cursor of terminal which remains after quitting vim)
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Use Back to delete the character to the left of the cursor
nnoremap <BS> i<BS><Esc>l

" Underline a line by ---
nnoremap <leader>u yypVr-

" Underline a line by ===
nnoremap <leader>d yypVr=

" Comment out line with //
nnoremap <leader>// I//<Esc>

" Comment out line with #
nnoremap <leader># I#<Esc>

" Comment out line with %
nnoremap <leader>% I%<Esc>

" Delete first character of line (e.g. comment character)
nnoremap <leader>) 0x<Esc>

" Delete first two characters of line (e.g. //)
nnoremap <leader>" 0xx<Esc>

" Clear highlighted search matches
nnoremap <leader>, :nohlsearch<CR>

" Toggle invisible characters
nnoremap <leader>. :set list!<CR>

" Use specific color scheme if it exists (default, if it doesn't exist)
silent! colorscheme slate

" Activate colorcolumn
set colorcolumn=81

" Function for toggling colorcolumn
function! g:ToggleColorColumn()
  if &colorcolumn == ''
    setlocal colorcolumn=81
  else
    setlocal colorcolumn&
  endif
endfunction

" Define formatting of invisible characters
set listchars=tab:>-,trail:.,eol:¬


" Key binding for toggling color column
nnoremap <leader>c :call g:ToggleColorColumn()<CR>

" Toggle highlighting of current line and column of cursor
nnoremap <leader>l :set cursorline!<CR>
set cursorline
hi CursorLine cterm=NONE ctermbg=DarkGray  " For some reason does not work

" Toggle display of line numbers
nnoremap <leader>n :set number!<CR>

" Minimum number of lines below or above the cursor when scrolling
set scrolloff=5

" Wrap lines at window border *between words*
set linebreak 

" Alternative for ':' for entering command line
"nnoremap - :

" Number of Ex commands (:) recorded in the history (default is 20)
set history=200

" Moving up and down in soft-wrapped lines
nnoremap j gj
nnoremap k gk

" Little one-line horizontal menu for completion suggestions
set wildmenu
" Complete to longest common substring and show alternatives in wildmenu
set wildmode=longest:full,full

" Disable arrow keys
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>

" Window operations with Ctrl-A (like in tmux)
"nnoremap <C-a> <C-w>

" Cycling between tabs as in tmux
"nnoremap <C-a>n gt
"nnoremap <C-a>p gT

" Closing a tab
"nnoremap tc     :tabclose<CR>


" Disabling all format options (e.g. no automatic insertion of comment char)
set formatoptions=c

" If a new file is opened, hide existing buffer instead of closing it
set hidden

" Tab and indenting setup
set tabstop=2     " Tab width
set shiftwidth=2  " Indent width of '>>' or '<<'
set expandtab     " Use spaces for tabs

" Enable the backspace key
set backspace=indent,eol,start

" No backup files (.swp)
set nobackup
set noswapfile

" Alternatives for Esc in insert mode
inoremap <C-k> <Esc>

" Enable detection of file type for file-type specific plugins
filetype plugin on

" Enable syntax highlighting
syntax on

" Event handlers
if has("autocmd")
  " Source the .vimrc file automatically when it is saved
  " autocmd bufwritepost .vimrc source $MYVIMRC
  " No colorcolumn in TeX files
  "autocmd filetype tex if v:version >= 703 set colorcolumn= endif
endif

" Open the .vimrc file in a separate tab for editing
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" Disable certain modules of the vim-pandoc plugin
let g:pandoc#modules#disabled = [ "spell", "folding" ]

" Disable "conceal" for the vim-pandoc-syntax plugin
let g:pandoc#syntax#conceal#use = 0

" StatusLine: status line colors of active and inactive windows
" (see :help cterm-colors, for iTerm use numbers under NR-8, '*' means '+8')
hi StatusLine ctermfg=black ctermbg=darkgreen cterm=bold
hi StatusLineNC ctermfg=white ctermbg=darkgray cterm=none

" WildMenu: color of the selected item in the wildemnu (filename completion bar). The
" color of the bar itself is equals to StatusLine.
hi WildMenu ctermbg=white ctermfg=black cterm=bold

" Windows: creating new windows like in tmux, and cycle between windows
set splitright
set splitbelow
nnoremap <C-W><Bar> :vnew<CR>
nnoremap <C-W>-     :new<CR>
nnoremap <Tab> <C-W>w

" Tabs: creating, moving between, and closing tabs like in tmux
nnoremap <C-w>C :tabnew<CR>
nnoremap <C-w>n gt
nnoremap <C-w>p gT
nnoremap <C-w>Q :tabclose<CR>

" TabLine: TabLineSel = selected, TabLine = unselected, TabLineFill = rest
hi TabLineSel ctermbg=darkgreen ctermfg=white cterm=bold
hi TabLine ctermbg=darkgray ctermfg=white cterm=none
hi TabLineFill ctermfg=black
" Color of tab number (preceding tab label)
hi TabLineSelNumber ctermbg=darkgreen ctermfg=yellow cterm=bold
hi TabLineNumber ctermbg=darkgray ctermfg=yellow cterm=bold

" Set custom tab line
set tabline=%!MyTabLine()

" Return string representing custom tab line (same principle as status line)
function! MyTabLine()
  let s = ''
  "Add substring consisting of ' <tab number> <tab label> ' for each tab
  for i in range(1, tabpagenr('$'))
    if i == tabpagenr()
      let numberHi = '%#TabLineSelNumber#'
      let labelHi = '%#TabLineSel#'
    else
      let numberHi = '%#TabLineNumber#'
      let labelHi = '%#TabLine#'
    endif
    let s .= numberHi . ' ' . i . ' ' . labelHi . '%{MyTabLabel(' . i . ')} '
  endfor
  " After all tabs, change color to TabLineFill and reset tab counter
  return s . '%#TabLineFill#%T'
endfunction

" Return label for a specific tab number. The label consists of the filename
" of the file in the current window in this tab.
function! MyTabLabel(n)
  " Get currently open buffers in this tab
  let buflist = tabpagebuflist(a:n)
  " Get buffer of current window in this tab
  let bufcurrent = buflist[tabpagewinnr(a:n) - 1]
  " Get filename of buffer
  let fname = fnamemodify(bufname(bufcurrent), ":t")
  if (fname == "")
    return '[No Name]'
  else
    return fname
endfunction


" Custom commands

" Jekyll
command! L e _layouts
command! I e _includes
command! S e _sass
command! P e _pages
command! C e _config.yml
command! A e assets

" Do Not Change The Working Directory When Opening A File
set noautochdir

nnoremap <leader>t :s/\<\(\w\)\(\S*\)/\u\1\L\2/g<CR>