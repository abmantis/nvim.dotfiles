return {
    'neovim/nvim-lspconfig',
    version = '2.*',
    cond = not vim.g.vscode,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local my_utils = require("abmantis.utils")
                local map = function(mode, keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    my_utils.setkeymap(mode, keys, func, desc, { buffer = ev.buf })
                end

                map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
                map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code Action')
                map('n', '<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')
            end,
        })

        vim.lsp.enable("basedpyright")
        vim.lsp.enable("clangd")
        vim.lsp.enable("jsonls")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("nixd")
        vim.lsp.enable("ruff")
        vim.lsp.enable("yamlls")

        vim.api.nvim_create_user_command("LspEnable",
            function(opts)
                vim.lsp.enable(opts.fargs[1])
            end,
            { nargs = 1, desc = "Enable an LSP server" }
        )
    end,
}
