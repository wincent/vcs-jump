let s:jump_path=shellescape(simplify(fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../bin/vcs-jump'))

function! s:set_title(title)
  if has('patch-7.4.2200')
    call setqflist([], 'a', {'title': a:title})
  elseif a:type ==# 'qf'
    let w:quickfix_title=a:title
  endif
endfunction

function! vcsjump#jump(command) abort
  let l:command=join(map(split(a:command), 'shellescape(v:val)'))
  cexpr system(s:jump_path . ' ' . l:command . ' 2> /dev/null')
  call s:set_title('vcs-jump ' . a:command)
  cwindow
endfunction
