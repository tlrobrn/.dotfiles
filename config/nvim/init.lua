-- Manage Plugins
require("paq")({
	"aktersnurra/no-clown-fiesta.nvim", -- colorscheme
	"neovim/nvim-lspconfig", -- Configurations for nvim LSP
	"jose-elias-alvarez/null-ls.nvim", -- LSP shim for other tools
	"nvim-lualine/lualine.nvim", -- Status line
	"savq/paq-nvim", -- Package Manager
	"terrortylor/nvim-comment", -- comment toggler
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- LSP UI
	{ "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" }, -- file tree
	{ "ms-jpq/coq.artifacts", branch = "artifacts" }, -- Completion snippets
	{ "ms-jpq/coq.thirdparty", branch = "3p" }, -- Completion 3rdparty libs
	{ "ms-jpq/coq_nvim", branch = "coq" }, -- Completion
	{ "nvim-tree/nvim-web-devicons", opt = true }, -- font icons
	"nvim-lua/plenary.nvim", --fuzzy finder dep
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			vim.cmd("TSUpdate")
		end,
	}, -- treesitter
	"vim-test/vim-test",
	"preservim/vimux",
})

local keymap = vim.keymap.set

-- colorscheme
require("no-clown-fiesta").setup({
	styles = {
		comments = { italic = true },
	},
})
vim.cmd([[colorscheme no-clown-fiesta]])

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

-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Base editor configs
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.g.mapleader = " "
-- vim.cmd[[highlight Comment cterm=italic]]
-- vim.cmd[[highlight htmlArg cterm=italic]]
-- vim.cmd[[highlight Type cterm=italic]]

-- JK for esc
keymap("i", "jk", "<ESC>", { noremap = true, silent = true })

-- Comment toggling
require("nvim_comment").setup({ comment_empty = false })

-- fuzzy finder
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
keymap("n", "<leader>gw", builtin.grep_string, {})
keymap("n", "<leader>be", builtin.buffers, {})
keymap("n", "<leader>fh", builtin.help_tags, {})

-- treesitter
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = { "lua" },
	},
	auto_install = false,
})

-- Testing
vim.g["test#strategy"] = "vimux"
keymap("n", "<leader>rf", ":wa<CR>:TestNearest<CR>", { silent = true })
keymap("n", "<leader>rb", ":wa<CR>:TestFile<CR>", { silent = true })
keymap("n", "<leader>ra", ":wa<CR>:TestSuite<CR>", { silent = true })
keymap("n", "<leader>rl", ":wa<CR>:TestLast<CR>", { silent = true })

-- Statusline
require("lualine").setup({})

-- Completion by COQ
vim.g.coq_settings = { auto_start = "shut-up" }
local coq = require("coq")
require("coq_3p")({
	{ src = "nvimlua", short_name = "nLUA", conf_only = true },
})

-- Filetree browser
keymap("n", "<leader>nt", "<cmd>CHADopen<cr>", { silent = true })
vim.g.chadtree_settings = {
	["theme.text_colour_set"] = "nerdtree_syntax_dark",
}

-- LSP
local lspconfig = require("lspconfig")

-- Setup for nvim lua
lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}))

-- Setup for stree
lspconfig.syntax_tree.setup({
	cmd = { "bundle", "exec", "stree", "lsp" },
})

-- Setup for ts/js
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({}))

-- Setup for ruby
lspconfig.solargraph.setup({})

-- autoformat
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.{js,jsx,ts,tsx}",
-- 	callback = function()
-- 		-- vim.lsp.buf.formatting_seq_sync()
-- 		vim.lsp.buf.format()
-- 	end,
-- 	group = vim.api.nvim_create_augroup("AutocmdForTSJSFormatting", {}),
-- })

require("lspsaga").init_lsp_saga()

-- Formatting setup
local null_ls = require("null-ls")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

null_ls.setup({
	on_attach = on_attach,
	default_timeout = 10000,
	sources = {
		null_ls.builtins.diagnostics.rubocop.with({
			command = "bundle",
			args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.diagnostics.rubocop._opts.args),
		}),
		null_ls.builtins.diagnostics.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.formatting.rubocop.with({
			command = "bundle",
			args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.formatting.rubocop._opts.args),
		}),
	},
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
