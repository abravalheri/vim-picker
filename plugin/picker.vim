" vim-picker: a fuzzy picker for Neovim and Vim
" Maintainer: Scott Stevenson <scott@stevenson.io>
" Source:     https://github.com/srstevenson/vim-picker

if exists('g:loaded_picker')
    finish
endif

let g:loaded_picker = 1

function! picker#IsNumber(variable) abort
    " Determine if a variable is a number.
    "
    " Parameters
    " ----------
    " variable : Any
    "     Value of the variable.
    "
    " Returns
    " -------
    " Boolean
    "     v:true if the variable is a number, v:false otherwise.
    return type(a:variable) ==# type(0)
endfunction

function! picker#IsString(variable) abort
    " Determine if a variable is a string.
    "
    " Parameters
    " ----------
    " variable : Any
    "     Value of the variable.
    "
    " Returns
    " -------
    " Boolean
    "     v:true if the variable is a string, v:false otherwise.
    return type(a:variable) ==# type('')
endfunction

for var in ['g:picker_find_executable', 'g:picker_find_flags', 'g:picker_selector']
    if exists(var)
        echoerr 'vim-picker:' var 'is deprecated; see :help picker-configuration.'
    endif
endfor

if exists('g:picker_custom_find_executable')
    if !picker#IsString(g:picker_custom_find_executable)
        echoerr 'vim-picker: g:picker_custom_find_executable must be a string'
    endif
endif

if exists('g:picker_custom_find_flags')
    if !picker#IsString(g:picker_custom_find_flags)
        echoerr 'vim-picker: g:picker_custom_find_flags must be a string'
    endif
else
    let g:picker_custom_find_flags = ''
endif

if exists('g:picker_selector_executable')
    if !picker#IsString(g:picker_selector_executable)
        echoerr 'vim-picker: g:picker_selector_executable must be a string'
    endif
else
    let g:picker_selector_executable = 'fzy'
endif

if exists('g:picker_selector_flags')
    if !picker#IsString(g:picker_selector_flags)
        echoerr 'vim-picker: g:picker_selector_flags must be a string'
    endif
else
    let g:picker_selector_flags = '--lines=' . &lines
endif

if exists('g:picker_split')
    if !picker#IsString(g:picker_split)
        echoerr 'vim-picker: g:picker_split must be a string'
    endif
else
    let g:picker_split = 'botright'
endif

if exists('g:picker_height')
    if !picker#IsNumber(g:picker_height)
        echoerr 'vim-picker: g:picker_height must be a number'
    endif
else
    let g:picker_height = 10
endif

command -bar -nargs=? -complete=dir PickerEdit call picker#Edit(<q-args>)
command -bar -nargs=? -complete=dir PickerSplit call picker#Split(<q-args>)
command -bar -nargs=? -complete=dir PickerTabedit call picker#Tabedit(<q-args>)
command -bar -nargs=? -complete=dir PickerVsplit call picker#Vsplit(<q-args>)
command -bar PickerBuffer call picker#Buffer()
command -bar PickerTag call picker#Tag()
command -bar PickerStag call picker#Stag()
command -bar PickerBufferTag call picker#BufferTag()
command -bar PickerHelp call picker#Help()
command -bar PickerListUserCommands call picker#ListUserCommands()

nnoremap <silent> <Plug>(PickerEdit) :PickerEdit<CR>
nnoremap <silent> <Plug>(PickerSplit) :PickerSplit<CR>
nnoremap <silent> <Plug>(PickerTabedit) :PickerTabedit<CR>
nnoremap <silent> <Plug>(PickerVsplit) :PickerVsplit<CR>
nnoremap <silent> <Plug>(PickerBuffer) :PickerBuffer<CR>
nnoremap <silent> <Plug>(PickerTag) :PickerTag<CR>
nnoremap <silent> <Plug>(PickerStag) :PickerStag<CR>
nnoremap <silent> <Plug>(PickerBufferTag) :PickerBufferTag<CR>
nnoremap <silent> <Plug>(PickerHelp) :PickerHelp<CR>
nnoremap <silent> <Plug>(PickerListUserCommands) :PickerListUserCommands<CR>

" The following mappings are deprecated but remain for backward compatibility.
" They suffer an issue whereby Vim will pause before executing a mapping if
" its name is a prefix of another mapping.
nnoremap <silent> <Plug>PickerEdit :PickerEdit<CR>
nnoremap <silent> <Plug>PickerSplit :PickerSplit<CR>
nnoremap <silent> <Plug>PickerTabedit :PickerTabedit<CR>
nnoremap <silent> <Plug>PickerVsplit :PickerVsplit<CR>
nnoremap <silent> <Plug>PickerBuffer :PickerBuffer<CR>
nnoremap <silent> <Plug>PickerTag :PickerTag<CR>
nnoremap <silent> <Plug>PickerStag :PickerStag<CR>
nnoremap <silent> <Plug>PickerBufferTag :PickerBufferTag<CR>
nnoremap <silent> <Plug>PickerHelp :PickerHelp<CR>
nnoremap <silent> <Plug>PickerListUserCommands :PickerListUserCommands<CR>
