-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_user_command("Dark", function()
    vim.o.background = "dark"
    vim.cmd("colorscheme monokai-pro")
end, {})
vim.api.nvim_create_user_command("Medium", function()
    vim.o.background = "dark"
    vim.cmd("colorscheme sonokai")
end, {})
vim.api.nvim_create_user_command("Light", function()
    vim.o.background = "light"
    vim.cmd("colorscheme github_light")
end, {})
