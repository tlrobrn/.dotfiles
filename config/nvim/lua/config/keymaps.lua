local keymap = vim.keymap.set

-- better esc
keymap("i", "jk", "<esc>", { silent = true, noremap = true })

-- paste over selected text without yanking
keymap("v", "p", '"_dP')
