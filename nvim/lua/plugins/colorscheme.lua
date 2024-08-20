-- if vim.env.TERM_PROFILE == "Terminal" then
--   return {
--     {
--       "loctvl842/monokai-pro.nvim",
--       opts = {
--         filter = "spectrum",
--       },
--     },
--     { "sainnhe/sonokai" },
--     {
--       "navarasu/onedark.nvim",
--       opts = {
--         style = "light",
--       },
--     },
--     {
--       "LazyVim/LazyVim",
--       opts = {
--         colorscheme = "onedark",
--       },
--     },
--   }
-- else
return {
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      filter = "spectrum",
    },
  },
  { "sainnhe/sonokai" },
  { "projekt0n/github-nvim-theme" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
-- end
