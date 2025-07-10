return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 49, -- assuming nvim-treesitter has priority = 50, the default
    cond = not vim.g.vscode,
    config = function()
        local presets = require("markview.presets");

        require("markview").setup({
            preview = {
                enable = true,
                enable_hybrid_mode = true,
                hybrid_modes = { "n" },
                preview_ignore = { markdown = { "!list_items" } }
            },
            markdown = {
                headings = presets.headings.glow,
                horizontal_rules = presets.dashed,
                list_items = {
                    shift_width = 1
                }
            }
        });
    end,
}
