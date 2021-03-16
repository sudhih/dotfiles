set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
setlocal path=src/**,ai_core/**,venv/lib/python3.7/site-packages/**
setlocal wildignore=*.pyc,bin,*egg*,__pycache__/*,build,dist

"^\s*\(from\|import\)\s*\zs\(\S\+\s\{-}\)*\ze\(\s*as\|,\|\s*(\|$\)
":s/\(|\|\\\)/\\\1/
set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\(\\s*as\\\|,\\\|\\s*(\\\|$\\)

function! PyInclude(fname)
    let parts = split(a:fname, '\s*import\s*')
    let l = parts[0]
    if len(parts) > 1
        let r = parts[1]
        let joined = join([l, r], '.')
        let fp = substitute(joined, '\.', '/', 'g') . '.py'
        let found = glob(fp, 1)
        if len(found)
            return found
        endif
    endif
    return substitute(l, '\.', '/', 'g') . '.py'
endfunction

setlocal includeexpr=PyInclude(v:fname)
setlocal define=\\s*\\<\\(def\\\|class\\)\\>

compiler python
nnoremap <buffer> <space> :silent make <bar> redraw!<CR>

" set foldmethod=indent
