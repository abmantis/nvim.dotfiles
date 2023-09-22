vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('x', "<leader>p", "\"_dP", { desc = "Paste without yanking" })

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic message" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Show file diagnostics" })
