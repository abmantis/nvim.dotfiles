return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        {
            "echasnovski/mini.diff",
            config = function()
                local diff = require("mini.diff")
                diff.setup({
                    -- Disabled by default
                    source = diff.gen_source.none(),
                })
            end,
        },
    },
    opts = {
        strategies = {
            chat = {
                roles = {
                    llm = function(adapter)
                        local name = adapter.formatted_name
                        if (adapter.model and adapter.model.name) then
                            name = name .. " (" .. adapter.model.name .. ")"
                        end
                        return name
                    end,
                },
            },
        },
    },
    init = function()
      require("abmantis.plugins.codecompanion.fidget-spinner"):init()
    end,
}
