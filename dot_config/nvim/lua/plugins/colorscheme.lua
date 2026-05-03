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
    opts = function()
      local term_profile = vim.env.TERM_PROFILE
      local colorscheme = "monokai-pro"
      local background = "dark"
      if term_profile == "Terminal" then
        colorscheme = "github_light"
        background = "light"
      end
      vim.o.background = background
      return { colorscheme = colorscheme }
    end,
  },
}
