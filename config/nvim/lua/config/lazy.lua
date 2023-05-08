-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Config lazy.nvim
require("lazy").setup("plugins", {
  defaults = { lazy = true, version = nil },
  install = { missing = true, colorscheme = { "monochrome" } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  performance = {
    rtp = {
      disabled_plugins = {},
    },
  },
})
vim.keymap.set("n", "<leader>z", "<cmd>:Lazy<cr>", { desc = "Lazy Plugin Manager" })
