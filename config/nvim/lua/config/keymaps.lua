local keymap = vim.keymap.set

-- jk for escape in insert mode
keymap("i", "jk", "<ESC>", { noremap = true, silent = true })

-- paste over selected text without yanking it
keymap("v", "p", '"_dP')
