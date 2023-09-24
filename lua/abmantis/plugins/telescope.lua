return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = not vim.g.vscode,
    config = function()
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
    end
}
