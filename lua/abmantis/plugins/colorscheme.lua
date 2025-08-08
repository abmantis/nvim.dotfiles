return {
    {
        "Mofiqul/vscode.nvim",
        cond = not vim.g.vscode,
        lazy = true,
        -- config = function()
        --     vim.cmd.colorscheme("vscode")
        -- end,
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
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        cond = not vim.g.vscode,
        config = function()
            local opts = {}
            local styles = require("tokyonight.colors").styles
            ---@type Palette
            local day_colors = {
                bg = "#ffffff",
            }
            styles.day = vim.tbl_extend("force", styles.day(opts) --[[@as Palette]], day_colors)
            vim.cmd.colorscheme("tokyonight")
        end
    }
}
