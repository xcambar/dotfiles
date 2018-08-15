" TODO: Fix when multiple windows are opened with the same buffer
hi Inactive ctermfg=8
set number

augroup SyntaxOnCurrentWindow
  au!
  au VimEnter     * if getwinvar(winnr(), '&ft') != '' | setlocal syntax=ON | endif
  au WinEnter     * if getwinvar(winnr(), '&ft') != '' | setlocal syntax=ON | endif
  au BufEnter     * if getwinvar(winnr(), '&ft') != '' | setlocal syntax=ON | endif
  au BufWinEnter  * if getwinvar(winnr(), '&ft') != '' | setlocal syntax=ON | endif
  au WinLeave     * setlocal syntax=OFF

  au FocusGained,BufEnter  * setlocal cursorline
  au FocusLost,BufLeave    * setlocal nocursorline

  au WinLeave     * syntax region Inactive start='^' end='$'
  au BufLeave     * syntax region Inactive start='^' end='$'
augroup END
