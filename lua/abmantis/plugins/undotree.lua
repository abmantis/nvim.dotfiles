return {
    'mbbill/undotree',
    cond = not vim.g.vscode,
    config = function()
        local my_utils = require('abmantis.utils')
        my_utils.setkeymap('n', '<leader>u', vim.cmd.UndotreeToggle, "Toggle undotree")
    end
}
