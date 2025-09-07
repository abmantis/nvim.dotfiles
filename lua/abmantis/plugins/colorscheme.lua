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
            local opts = {
                light_style = "moon"
            }
            local styles = require("tokyonight.colors").styles
            ---@type Palette
            local day_colors = {
                bg = "#ffffff",
                bg_dark = "#f8f9fa",
                bg_dark1 = "#f1f3f4",
                bg_highlight = "#e8eaed",
                blue = "#1a73e8",
                blue0 = "#1557b0",
                blue1 = "#0d7377",
                blue2 = "#0891b2",
                blue5 = "#006a6b",
                blue6 = "#004d40",
                blue7 = "#c8d6e5",
                comment = "#5f6368",
                cyan = "#00838f",
                dark3 = "#9aa0a6",
                dark5 = "#80868b",
                fg = "#202124",
                fg_dark = "#3c4043",
                fg_gutter = "#dadce0",
                green = "#137333",
                green1 = "#00695c",
                green2 = "#00796b",
                magenta = "#8e24aa",
                magenta2 = "#c2185b",
                orange = "#ea4335",
                purple = "#9c27b0",
                red = "#d93025",
                red1 = "#b71c1c",
                teal = "#00695c",
                terminal_black = "#dadce0",
                yellow = "#f57f17",
                git = {
                    add = "#0f9d58",
                    change = "#1a73e8",
                    delete = "#d93025",
                },
            }
            styles.day = vim.tbl_extend("force", styles.day(opts) --[[@as Palette]], day_colors)
            vim.cmd.colorscheme("tokyonight")
        end
    }
}
