local utils = require('abmantis.utils')

vim.g.mapleader = " "
utils.setkeymap("n", "<leader>pv", vim.cmd.Explore, "Show explorer")
utils.setkeymap("n", "<C-d>", "<C-d>zz", "Move down 1/2 page")
utils.setkeymap("n", "<C-u>", "<C-u>zz", "Move up 1/2 page")
utils.setkeymap("n", "n", "nzzzv", "Next find result")
utils.setkeymap("n", "N", "Nzzzv", "Previous find result")

utils.setkeymap('x', "<leader>p", "\"_dP", "Paste without yanking")

utils.setkeymap('n', "<leader>sp", "\"+p", "Paste from system clipboard")
utils.setkeymap('v', "<leader>sp", "\"+p", "Paste from system clipboard")
utils.setkeymap('n', "<leader>sP", "\"+P", "Paste from system clipboard")

utils.setkeymap('n', "<leader>sy", "\"+y", "Yank to system clipboard")
utils.setkeymap('v', "<leader>su", "\"+y", "Yank to system clipboard")
utils.setkeymap('n', "<leader>sY", "\"+Y", "Yank to system clipboard")

utils.setkeymap('n', '<space>e', vim.diagnostic.open_float, "Show line diagnostics")
utils.setkeymap('n', '[d', vim.diagnostic.goto_prev, "Previous diagnostic message")
utils.setkeymap('n', ']d', vim.diagnostic.goto_next, "Next diagnostic message")
utils.setkeymap('n', '<space>q', vim.diagnostic.setloclist, "Show file diagnostics")
