return { {
    'rose-pine/neovim',
    name = 'rose-pine',
    cond = not vim.g.vscode,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("rose-pine")
    end,
},
    { "catppuccin/nvim", name = "catppuccin"}
}
