return {
    'RRethy/vim-illuminate',
    cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
        require('illuminate').configure({})
    end
}
