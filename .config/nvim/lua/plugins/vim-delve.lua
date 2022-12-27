local M = {
 "sebdah/vim-delve",
}

function M.config()
  vim.cmd [[
    if executable('dlv')
      let test#go#runner = 'delve'
      let test#go#delve#auto_continue = v:true
    endif

    augroup goAutoDebugger
      autocmd!
      autocmd FileType go noremap <leader>d <cmd>DlvToggleBreakpoint<cr>
    augroup END
    ]]

  end

  return M
