vim.api.nvim_exec([[
  function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let buff_name = bufname(buflist[winnr - 1])
    let file_name = fnamemodify(buff_name, ':t')
    if file_name == ''
      let file_name = 'NO NAME'
    endif
    return '[' .. a:n .. '] ' .. file_name
  endfunction

  function MyTabLine()
    let s = ''

    for i in range(tabpagenr('$'))
      " select the highlighting
      if i + 1 == tabpagenr()
        let s ..= '%#TabLineSel#'
      else
        let s ..= '%#TabLine#'
      endif

      " set the tab page number (for mouse clicks)
      let s ..= '%' .. (i + 1) .. 'T'
      " the label is made by MyTabLabel()
      let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s ..= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
      let s ..= '%=%#TabLine#%999X[X]'
    endif

    return s
  endfunction
]], true)

vim.api.nvim_exec([[
  autocmd BufEnter * setlocal tabline=%!MyTabLine()
]], true)


