return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    config = function()
      local components = require("plugins.statusline.components")

      require("lualine").setup({
        options = {
          theme = "nordic",
          component_separators = {},
          section_separators = {},
          disabled_filetypes = {
            statusline = { "alpha", "lazy" },
            winbar = {
              "help",
              "alpha",
              "lazy",
            },
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "diff", components.diagnostics, "filename" },
          lualine_x = { components.lsp_client, components.spaces, "filetype", "progress" },
          lualine_y = {},
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "diff" },
          lualine_y = { "location" },
          lualine_z = {},
        },
        extensions = { "nvim-tree", "toggleterm", "quickfix" },
      })
    end,
  },
}
