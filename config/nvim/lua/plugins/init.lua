return {
  { "lewis6991/impatient.nvim", lazy = false },
  "nvim-lua/plenary.nvim",
  { "tpope/vim-rails", lazy = false },
  -- {
  --   "kdheepak/monochrome.nvim",
  --   lazy = false,
  --   config = function()
  --     vim.g.monochrome_style = "amplified"
  --     vim.cmd([[colorscheme monochrome]])
  --   end,
  -- },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    -- priority = 1000,
    config = function()
      require("nordic").load({
        bold_keywords = true,
        transparent_bg = true,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_formatter = "<abbrev_sha> - <author_time>:<author>",
      })
    end,
  },
}
