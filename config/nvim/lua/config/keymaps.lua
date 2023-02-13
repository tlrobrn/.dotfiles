local keymap = vim.keymap.set

-- jk for escape in insert mode
keymap("i", "jk", "<ESC>", { noremap = true, silent = true })

-- paste over selected text without yanking it
keymap("v", "p", '"_dP')

-- move lines
keymap("n", "<C-j>", ":m .+1<CR>==")
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv")
keymap("i", "<C-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<C-k>", ":m .-2<CR>==")
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv")
keymap("i", "<C-k>", "<Esc>:m .-2<CR>==gi")
