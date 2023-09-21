return {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
        require('gitsigns').setup()
    end
}
