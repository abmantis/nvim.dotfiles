return {
    'fresh2dev/zellij.vim',
    cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
        local utils = require('abmantis.utils')

        vim.g.zellij_navigator_no_default_mappings = 1

        utils.setkeymap("n", "<A-h>", ":ZellijNavigateLeft<CR>", "Move to left zellij pane")
        utils.setkeymap("n", "<A-j>", ":ZellijNavigateDown<CR>", "Move to down zellij pane")
        utils.setkeymap("n", "<A-k>", ":ZellijNavigateUp<CR>", "Move to up zellij pane")
        utils.setkeymap("n", "<A-l>", ":ZellijNavigateRight<CR>", "Move to right zellij pane")
    end,
}
