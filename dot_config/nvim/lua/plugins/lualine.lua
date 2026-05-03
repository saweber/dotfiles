return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = false,
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
