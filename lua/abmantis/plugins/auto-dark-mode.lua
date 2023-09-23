return {
    "f-person/auto-dark-mode.nvim",
    cond = not vim.g.vscode,
    config = {
        -- update_interval = 10000,
        set_dark_mode = function()
            vim.cmd("colorscheme rose-pine-main")
        end,
        set_light_mode = function()
            vim.cmd("colorscheme rose-pine-dawn")
        end,
    },
}
