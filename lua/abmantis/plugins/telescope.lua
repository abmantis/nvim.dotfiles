return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = not vim.g.vscode,
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Find Project Files"})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {desc = "Search Git Files"})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {desc = "Project Search"});
        vim.keymap.set('n', 'gr', builtin.lsp_references, {desc = 'Goto References'})
        vim.keymap.set('n', 'gI', builtin.lsp_implementations, {desc = 'Goto Implementation'})
        vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {desc = 'Document Symbols'})
        vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, {desc = 'Workspace Symbols'})
    end
}
