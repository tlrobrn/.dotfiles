vim.opt.cmdheight = 0

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

function Statuscolumn()
  local lines = vim.fn.line("$")
  local minwidth = #tostring(lines)

  return "%s %" .. minwidth .. "l %" .. minwidth .. "r "
end
vim.opt.statuscolumn = "%{%v:lua.Statuscolumn()%}"

-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"

-- Base editor configs
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
