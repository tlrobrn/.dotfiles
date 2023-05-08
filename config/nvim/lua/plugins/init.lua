return {
  { "lewis6991/impatient.nvim", lazy = false },
  "nvim-lua/plenary.nvim",
  {
    "kdheepak/monochrome.nvim",
    lazy = false,
    config = function()
      vim.g.monochrome_style = "amplified"
      vim.cmd([[colorscheme monochrome]])
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
      require("gitsigns").setup()
    end,
  },
}
