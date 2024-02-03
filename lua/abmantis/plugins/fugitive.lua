return {
    'tpope/vim-fugitive',
    cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
        local my_utils = require('abmantis.utils')
        my_utils.setkeymap('n', '<leader>pg', ':Ggr <cword>', "Grep word under cursor")
    end
}
