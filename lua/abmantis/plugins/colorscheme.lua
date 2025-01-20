return {
    {
        "Mofiqul/vscode.nvim",
        cond = not vim.g.vscode,
        config = function()
            vim.cmd.colorscheme("vscode")
        end,
    },
    {
        "sainnhe/edge",
        name = "edge",
        cond = not vim.g.vscode,
        priority = 1000,
        config = function()
            vim.g.edge_style = "neon"
        end,
        lazy = true,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        cond = not vim.g.vscode,
        lazy = true,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        cond = not vim.g.vscode,
        lazy = true,
    }
}
