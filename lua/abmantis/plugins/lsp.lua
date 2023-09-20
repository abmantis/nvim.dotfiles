return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
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
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local map = function(mode, keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = desc })
                end

                map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                map('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
                map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
                map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                -- map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
                -- map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
                -- map('n', '<leader>wl', function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, '[W]orkspace [L]ist Folders')
                map('n', '<leader>cf', vim.lsp.buf.format, '[C]ode [F]ormat current buffer')
                map('v', '<leader>cf', function()
                    vim.lsp.buf.format({
                        range = {
                            ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                        }
                    })
                end, '[C]ode [F]ormat current selection')
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
                local server_conf = (servers[server_name] or {})
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    init_options = server_conf.init_options,
                    settings = server_conf.settings,
                    filetypes = server_conf.filetypes,
                }
            end
        }
    end,
}
