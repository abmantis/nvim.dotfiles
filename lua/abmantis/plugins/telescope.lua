return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
        local my_helpers = require('abmantis.plugins.telescope.helpers')
        require('telescope').setup {
            defaults = {
                path_display = my_helpers.path_display,
                layout_config = {
                    horizontal = {
                        width = { padding = 0 },
                        height = { padding = 0 },
                    },
                },
                sorting_strategy = "ascending",
            },
            pickers = {
                current_buffer_tags = { fname_width = 100, },
                jumplist = { fname_width = 100, },
                loclist = { fname_width = 100, },
                live_grep = { fname_width = 100, },
                lsp_definitions = { fname_width = 100, },
                lsp_document_symbols = { symbol_width = 50, },
                lsp_dynamic_workspace_symbols = { symbol_width = 50, },
                lsp_implementations = { fname_width = 100, },
                lsp_incoming_calls = { fname_width = 100, },
                lsp_outgoing_calls = { fname_width = 100, },
                lsp_references = { fname_width = 100, },
                lsp_type_definitions = { fname_width = 100, },
                lsp_workspace_symbols = { fname_width = 100, },
                quickfix = { fname_width = 100, },
                tags = { fname_width = 100, },

            }
        }
        local builtin = require('telescope.builtin')
        local my_pickers = require('abmantis.plugins.telescope.pickers')
        local my_utils = require('abmantis.utils')
        my_utils.setkeymap('n', '<leader>pf', builtin.find_files, "Find Project Files")
        my_utils.setkeymap('n', '<leader>gf', builtin.git_files, "Search Git Files")
        my_utils.setkeymap('n', '<leader>ps', my_pickers.live_grep_in_folder, "Project Search");
        my_utils.setkeymap('n', 'gr', builtin.lsp_references, 'Goto References')
        my_utils.setkeymap('n', 'gI', builtin.lsp_implementations, 'Goto Implementation')
        my_utils.setkeymap('n', '<leader>ds', builtin.lsp_document_symbols, 'Document Symbols')
        my_utils.setkeymap('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        my_utils.setkeymap('n', '<space>q', builtin.diagnostics, "Show file diagnostics")
    end
}
