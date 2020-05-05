if has('vim_starting')
  " Show vertical line cursor on insert-mode
  let &t_SI .= "\e[6 q"
  " Show block bar cursor on normal-mode
  let &t_EI .= "\e[2 q"
  " Show under line cursor on visual-mode
  let &t_SR .= "\e[4 q"
endif
