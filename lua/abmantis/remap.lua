local utils = require('abmantis.utils')

vim.g.mapleader = " "
utils.setkeymap("t", "<Esc>", "<C-\\><C-n>", "Exit terminal mode using Esc")
utils.setkeymap("t", "<S-Esc>", "<Esc>", "Send <Esc> in terminal mode")

-- utils.setkeymap("n", "<A-h>", "<c-w>h", "Move to left window")
-- utils.setkeymap("n", "<A-j>", "<c-w>j", "Move to down window")
-- utils.setkeymap("n", "<A-k>", "<c-w>k", "Move to up window")
-- utils.setkeymap("n", "<A-l>", "<c-w>l", "Move to right window")
-- utils.setkeymap("t", "<A-h>", "<C-\\><C-n><c-w>h", "Move to left window")
-- utils.setkeymap("t", "<A-j>", "<C-\\><C-n><c-w>j", "Move to down window")
-- utils.setkeymap("t", "<A-k>", "<C-\\><C-n><c-w>k", "Move to up window")
-- utils.setkeymap("t", "<A-l>", "<C-\\><C-n><c-w>l", "Move to right window")

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
utils.setkeymap('v', "<leader>sy", "\"+y", "Yank to system clipboard")
utils.setkeymap('n', "<leader>sY", "\"+Y", "Yank to system clipboard")

utils.setkeymap('n', '<space>e', vim.diagnostic.open_float, "Show line diagnostics")
utils.setkeymap('n', '[d', vim.diagnostic.goto_prev, "Previous diagnostic message")
utils.setkeymap('n', ']d', vim.diagnostic.goto_next, "Next diagnostic message")
-- utils.setkeymap('n', '<space>q', vim.diagnostic.setloclist, "Show file diagnostics")
