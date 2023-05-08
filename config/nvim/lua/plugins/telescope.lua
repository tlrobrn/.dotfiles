return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>gw", "<cmd>Telescope grep_string<cr>", desc = "Find Word" },
      { "<leader>gg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>be", "<cmd>Telescope buffers<cr>", desc = "Open buffers" },
    },
    config = function()
      local on_mac = vim.fn.has("macunix") == 1

      require("telescope").setup({
        extensions = {
          file_browser = {
            initial_mode = "normal",
            hidden = true,
            use_fd = on_mac, -- Ubuntu fd install isn't compatible
          },
          emoji = {
            action = function(emoji)
              -- insert emoji when picked
              vim.api.nvim_put({ emoji.value }, "c", false, true)
            end,
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>nt", "<cmd>Telescope file_browser<cr>", desc = "File Explorer" },
      {
        "<leader>nf",
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
        desc = "File Explorer at current file",
      },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "xiyaowong/telescope-emoji.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>fe", "<cmd>Telescope emoji<cr>", desc = "Emoji explorer" },
    },
    config = function()
      require("telescope").load_extension("emoji")
    end,
  },
}
