return {
  "vim-test/vim-test",
  dependencies = { "preservim/vimux" },
  keys = {
    { "<leader>rf", "<cmd>wa<cr><cmd>TestNearest<cr>", desc = "Test nearest" },
    { "<leader>rb", "<cmd>wa<cr><cmd>TestFile<cr>", desc = "Test buffer" },
    { "<leader>rl", "<cmd>wa<cr><cmd>TestLast<cr>", desc = "Test last" },
  },
  config = function()
    vim.g["test#strategy"] = "vimux"
  end,
}
