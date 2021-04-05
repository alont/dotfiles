set ignorecase smartcase    " Enable smart case-sensitive/insensitive search
set hlsearch                " Highlight matched search string
set incsearch               " Enable incremental search
set wrapscan                " When search hits EOF, wrap back to top
set nowrap                  " Disable word-wrap
syntax enable               " Enable syntax-coloring
set shiftwidth=4            " Number of spaces for each auto-indent level
set tabstop=4               " Number of spaces used to display a single TAB character 
set expandtab               " Insert spaces instead of tab characters
set nostartofline           " Maintain column position of cursor when scrolling up or down	
set showmatch               " Briefly jump to the matching paren/bracket/brace when closing
set ruler                   " Display info about current location in file
map gf :sp <cfile><CR>      " Make gf open the file in a split window, not replace the current buffer
set nobackup                " Do not back up files
set nowritebackup           " Do not back up files
set visualbell t_vb=        " Disable beeps and flashing on error
set autowrite               " Saves all open buffers if ':make' is called
set backspace=2
set number                  " Display line numbers 
set wildmenu
filetype on                 " Enable file type detection
set nocp
filetype plugin on
colorscheme default         " Choose default color scheme
set guitablabel=%t          " Display only base filename in tabs (No path)
hi LineNr guifg=#424242     " Reduce visibility of line numbers


" set tags=c:\project\build\tags

" Close OmniCppComplete preview window after completion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

cscope add $PROJECT/cscope.out $PROJECT

"set cscopequickfix=s-,c-,d-,i-,t-,e- " Display cscope results in quickfix window
"set cscopeverbose
"set cscopetag               " Use cscope database, not tags,  on ':tag' and CTRL-]
set cscopetagorder=0        " Set cscope databases to be searched before tag files
set cscopepathcomp=0        " Display entire file path


nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>



" Enable doxygen highlighting for c/c++ source files.
au BufNewFile,BufRead *.{c,cpp,h,hpp,hxx}   set syntax=cpp.doxygen
au BufNewFile,BufRead *.{log}   set syntax=rvnlog


" Set c/cpp aware auto-indentation
au BufNewFile,BufRead *.{c,cpp,h,hpp,hxx}   set cindent

" Automatically inserts '*' before multiline comments
au BufNewFile,BufRead *.{c,cpp,h,hpp,hxx}   set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" Key mapping
" -----------

map gf :sp <cfile><CR>" Make gf open the file in a split window, not replace the current buffer
map <F11> :set invnumber<CR>" Toggle line number display
map <F10> :set invwrap<CR>" Toggle word wrap
map <C-Tab> :bn<CR>"Cycle between open buffers
map :wq <nop> " Disable ':wq', which always gets hit by mistake when trying to ':w'. Use ':x' instead.

" set runtimepath=$PROJECT/tools/vim,$VIMRUNTIME
" au BufNewFile,BufRead *.log             setf rvnlog

" Platform dependent settings
" ---------------------------
if has("unix") " Unix 
    " Map F7 to: Write all buffers, generate tags file, run make
    au BufNewFile,BufRead *.{c,cpp,h,hpp,hxx}   map <F7> :wall<CR>:!ctags * -R<CR>:make CFG=debug<CR>
    set tags=$PROJECT_DIR/tags,/usr/include/tags
else " Windows
endif

" Under Win32, to use a single instance of Vim to open all
" files, use "gvim.exe --servername SOMENAME --remote-silent"

