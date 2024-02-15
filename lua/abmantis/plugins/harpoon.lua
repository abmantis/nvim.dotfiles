return {
    'ThePrimeagen/harpoon',
    cond = not vim.g.vscode,
    event = "VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require('harpoon').setup({
            menu = {
                width = 80,
            }
        })
        local utils = require('abmantis.utils')
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        utils.setkeymap("n", "<leader>ha", mark.add_file, "Harpoon: Add file")
        utils.setkeymap("n", "<leader>hh", ui.toggle_quick_menu, "Harpoon: toggle quick menu")

        utils.setkeymap("n", "<C-h>", function() ui.nav_file(1) end, "Harpoon: Navigate to file 1")
        utils.setkeymap("n", "<C-j>", function() ui.nav_file(2) end, "Harpoon: Navigate to file 2")
        utils.setkeymap("n", "<C-k>", function() ui.nav_file(3) end, "Harpoon: Navigate to file 3")
        utils.setkeymap("n", "<C-l>", function() ui.nav_file(4) end, "Harpoon: Navigate to file 4")
    end,
}
