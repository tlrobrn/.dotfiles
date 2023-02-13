return {
  {
    "aktersnurra/no-clown-fiesta.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("no-clown-fiesta").setup({
        transparent = true,
      })
      vim.cmd([[colorscheme no-clown-fiesta]])
    end,
  },
}
