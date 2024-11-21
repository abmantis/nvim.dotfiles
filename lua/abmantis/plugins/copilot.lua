return {
    'github/copilot.vim',
    cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
        vim.g.copilot_enabled = 0
    end,
}
