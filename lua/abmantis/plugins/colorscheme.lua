return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        cond = not vim.g.vscode,
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme("rose-pine")
        -- end,
    },
    {
        "sainnhe/edge",
        name = "edge",
        cond = not vim.g.vscode,
        priority = 1000,
        config = function()
            vim.g.edge_style = "neon"
            vim.cmd.colorscheme("edge")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        cond = not vim.g.vscode,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("catppuccin-mocha")
        end,
    }
}
