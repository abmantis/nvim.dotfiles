return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    cond = not vim.g.vscode,
    event = "BufRead",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

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
                map('n', 'gd', vim.lsp.buf.definition, 'Goto Definition')
                map('n', '<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
                map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
                map('n', '<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')
                map('n', 'gD', vim.lsp.buf.declaration, 'Goto Declaration')
                -- map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
                -- map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
                -- map('n', '<leader>wl', function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, 'Workspace List Folders')
            end,
        })

        --  Add any additional override configuration in the following tables. They will be passed to
        --  the `settings` field of the server config. You must look up that documentation yourself.
        --
        --  If you want to override the default filetypes that your language server will attach to you can
        --  define the property 'filetypes' to the map in question.
        local servers = {
            lua_ls = {
                settings = {
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
                }
            },
            nil_ls = {
                settings = {
                    ['nil'] = {
                        formatting = { command = { "nixpkgs-fmt" } }
                    }
                }
            },
            pyright = {
                on_attach = function(client, bufnr)
                    -- Disable all capabilities except diagnostics. These capabilities will
                    -- be provided by pylsp
                    client.server_capabilities.callHierarchyProvider = false
                    client.server_capabilities.codeActionProvider = false
                    client.server_capabilities.codeLensProvider = false
                    client.server_capabilities.colorProvider = false
                    client.server_capabilities.completionProvider = false
                    client.server_capabilities.definitionProvider = false
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentHighlightProvider = false
                    client.server_capabilities.documentLinkProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                    client.server_capabilities.documentSymbolProvider = false
                    client.server_capabilities.executeCommandProvider = false
                    client.server_capabilities.foldProvider = false
                    client.server_capabilities.hoverProvider = false
                    client.server_capabilities.implementationProvider = false
                    client.server_capabilities.referencesProvider = false
                    client.server_capabilities.renameProvider = false
                    client.server_capabilities.selectionRangeProvider = false
                    client.server_capabilities.semanticTokensProvider = nil
                    client.server_capabilities.signatureHelpProvider = false
                    client.server_capabilities.typeDefinitionProvider = false
                    client.server_capabilities.workspaceProvider = false
                    client.server_capabilities.workspaceSymbolProvider = false
                end,
            },
            pylsp = {
                on_attach = function(client, bufnr)
                    -- Disable diagnostic capability. This will be provided by pyright.
                    client.server_capabilities.diagnosticProvider = false
                end,
                settings = {
                    pylsp = {
                        plugins = {
                            autopep8 = { enabled = false },
                            pycodestyle = { enabled = false },
                            pydocstyle = { enabled = false },
                            pyflakes = { enabled = false },
                            pylint = { enabled = false },
                            flake8 = { enabled = false },
                            mypy = { enabled = false },
                            mccabe = { enabled = false },
                            yapf = { enabled = false },

                        }
                    }
                }
            }
        }

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- CoPilot only works with utf-8 offset encoding, so restrct it for now.
        -- This seems to mess up ruff, so use ruff-lsp instead if needed
        -- capabilities.offsetEncoding = 'utf-8'

        local lspconfig = require('lspconfig')
        local setup_ls = function(server_name)
            local server_conf = (servers[server_name] or {})
            lspconfig[server_name].setup {
                capabilities = capabilities,
                init_options = server_conf.init_options,
                settings = server_conf.settings,
                filetypes = server_conf.filetypes,
                on_attach = server_conf.on_attach,
            }
        end

        -- LS to setup even without mason installation
        setup_ls("clangd")
        setup_ls("lua_ls")
        setup_ls("nil_ls")
        setup_ls("pylsp")
        setup_ls("pyright")
        setup_ls("ruff")

        vim.api.nvim_create_user_command("LspSetup",
            function(opts)
                setup_ls(opts.fargs[1])
            end,
            { nargs = 1 }
        )

        local mason_lspconfig = require 'mason-lspconfig'
        mason_lspconfig.setup {}
        mason_lspconfig.setup_handlers {
            function(server_name)
                setup_ls(server_name)
            end
        }
    end,
}
