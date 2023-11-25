if vim.env.TERM_PROFILE == "Terminal" then
  return {
    { "projekt0n/github-nvim-theme" },
    { "loctvl842/monokai-pro.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "github_light",
      },
    },
  }
else
  return {
    { "projekt0n/github-nvim-theme" },
    { "loctvl842/monokai-pro.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "monokai-pro",
      },
    },
  }
end
