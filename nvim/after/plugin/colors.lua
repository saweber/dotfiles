if (vim.env.ITERM_PROFILE == "Dark" or vim.env.ITERM_PROFILE == "")
then
  vim.o.background = "dark"
  vim.cmd('let g:sonokai_style = "shusia"')
  vim.cmd('colorscheme sonokai')
else
  vim.o.background = "light"
  vim.cmd('colorscheme iceberg')
end

vim.api.nvim_create_user_command('Dark',
  function()
    vim.o.background = "dark"
    vim.cmd('let g:sonokai_style = "shusia"')
    vim.cmd('colorscheme sonokai')
  end,
  {}
)
vim.api.nvim_create_user_command(
  'Light',
  function()
    vim.o.background = "light"
    vim.cmd('colorscheme iceberg')
  end,
  {}
)
