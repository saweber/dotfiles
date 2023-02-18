if (vim.env.ITERM_PROFILE == "dark")
then
  vim.o.background = "dark"
  vim.cmd('let g:sonokai_style = "shusia"')
  vim.cmd('colorscheme sonokai')
else
  vim.o.background = "light"
  vim.cmd('colorscheme iceberg')
end
