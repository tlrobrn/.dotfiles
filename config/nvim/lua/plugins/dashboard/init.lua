local header = {
  "",
  "",
  "",
  "👋🌎",
  "",
}

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = header
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
      dashboard.button("g", "  Grep", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("e", "  New file", "<cmd>ene<bar>startinsert<cr>"),
      dashboard.button("q", "  Quit", "<cmd>q<cr>"),
    }

    require("alpha").setup(dashboard.opts)
  end,
}
