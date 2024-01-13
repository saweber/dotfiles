if vim.env.TERM_PROFILE == "Terminal" then
  return {
    {
      "loctvl842/monokai-pro.nvim",
      opts = {
        filter = "spectrum",
      },
    },
    { "sainnhe/sonokai" },
    {
      "navarasu/onedark.nvim",
      opts = {
        style = "cool",
      },
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "onedark",
      },
    },
  }
else
  return {
    {
      "loctvl842/monokai-pro.nvim",
      opts = {
        filter = "spectrum",
      },
    },
    { "sainnhe/sonokai" },
    {
      "navarasu/onedark.nvim",
      opts = {
        style = "light",
      },
    },
    { "rebelot/kanagawa.nvim" },
    { "navarasu/onedark.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "monokai-pro",
      },
    },
  }
end
