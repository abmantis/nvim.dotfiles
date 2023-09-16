return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = not vim.g.vscode,
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Find [p]project [f]iles"})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {desc = "Search [G]it [F]iles"})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', 'gr', builtin.lsp_references, {desc = '[G]oto [R]eferences'})
        vim.keymap.set('n', 'gI', builtin.lsp_implementations, {desc = '[G]oto [I]mplementation'})
        vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {desc = '[D]ocument [S]ymbols'})
        vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, {desc = '[W]orkspace [S]ymbols'})
    end
}
