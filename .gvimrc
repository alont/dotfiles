set columns=100             " Window width
set lines=37                " Window height
winpos 100 0                " Window horizontal and vertical position
set guioptions+=b           " Add bottom scrollbar
set guioptions-=T           " Remove GUI toolbar
set visualbell t_vb=        " Disable beeps and flashing on error - TODO: See why it needs to be duplicated from .vimrc
"colorscheme darkblue        " Choose DarkBlue color scheme

" Platform dependent settings
" ---------------------------
if has("fork") " Unix 
    set gfn=Bitstream\ Vera\ Sans\ Mono\ 12
else " Windows
    set gfn=Bitstream_Vera_Sans_Mono:h9:cANSI  " Default font
endif

