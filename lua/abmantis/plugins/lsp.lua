return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event="BufRead",
    cond = not vim.g.vscode,
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
    config = function()
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            -- nmap('<leader>wl', function()
            --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, '[W]orkspace [L]ist Folders')
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        --  Add any additional override configuration in the following tables. They will be passed to
        --  the `settings` field of the server config. You must look up that documentation yourself.
        --
        --  If you want to override the default filetypes that your language server will attach to you can
        --  define the property 'filetypes' to the map in question.
        local servers = {
            -- clangd = {},
            -- gopls = {},
            -- pyright = {},
            -- rust_analyzer = {},
            -- tsserver = {},
            -- html = { filetypes = { 'html', 'twig', 'hbs'} },

            lua_ls = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    },
                    telemetry = { enable = false },
                },
            },
        }

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Ensure the servers above are installed
        local mason_lspconfig = require 'mason-lspconfig'
        mason_lspconfig.setup {
        --     ensure_installed = vim.tbl_keys(servers),
        }
        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                }
            end
        }
    end,
}
