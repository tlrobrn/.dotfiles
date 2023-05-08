return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "ruby",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
        indent = { enable = true },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
      })
    end,
  },
}
