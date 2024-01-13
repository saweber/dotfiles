-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_user_command("Dark", function()
  vim.o.background = "dark"
  vim.cmd("colorscheme monokai-pro")
end, {})
vim.api.nvim_create_user_command("Light", function()
  vim.o.background = "light"
  vim.cmd("colorscheme onedark")
end, {})
