return {
    'SmiteshP/nvim-navic',
    cond = not vim.g.vscode,
    dependencies = {
        'neovim/nvim-lspconfig',
    },
    config = function()
        require("nvim-navic").setup {
            lsp = {
                auto_attach = true,
            },
        }
    end
}
