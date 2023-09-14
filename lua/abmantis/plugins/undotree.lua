return {
    'mbbill/undotree',
    cond = not vim.g.vscode,
    config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
}
