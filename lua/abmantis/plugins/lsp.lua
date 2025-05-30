return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    version = '1.*',
    cond = not vim.g.vscode,
    event = "BufRead",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim',           config = true },
        { 'williamboman/mason-lspconfig.nvim', version = '1.*' },

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim',                 opts = {} },
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
                settings = {
                    python = { analysis = { typeCheckingMode = "off" } },
                }
            },
            basedpyright = {
                settings = {
                    basedpyright = { analysis = { typeCheckingMode = "off" } },
                }
            }
        }

        local capabilities = vim.lsp.protocol.make_client_capabilities()
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
        setup_ls("basedpyright")
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
