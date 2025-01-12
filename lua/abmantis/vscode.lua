if not vim.g.vscode then
    return
end

local vsc = require("vscode")

vim.keymap.set("n", "<leader>pv", function()
    vsc.action('workbench.files.action.showActiveFileInExplorer', {})
end)

vim.keymap.set("n", "<leader>pf", function()
    vsc.action('workbench.action.quickOpen', {})
end)

vim.keymap.set("n", "<leader>ps", function()
    vsc.action('workbench.action.findInFiles', { args = { query = vim.fn.expand("<cword>"), replace = '' } })
end)

vim.keymap.set("x", "<leader>ps", function()
    vim.api.nvim_feedkeys('"py', 'n', false)
    vim.defer_fn(function()
        vsc.action('workbench.action.findInFiles', { args = { query = vim.fn.getreg('p'), replace = '' } })
    end, 1)
end)

vim.keymap.set('n', 'gr', function()
    vsc.action('editor.action.referenceSearch.trigger', {})
end)
vim.keymap.set('n', 'gI', function()
    vsc.action('editor.action.goToImplementation', {})
end)
vim.keymap.set('n', '<leader>ds', function()
    vsc.action('workbench.action.gotoSymbol', {})
end)
vim.keymap.set('n', '<leader>ws', function()
    vsc.action('workbench.action.showAllSymbols', {})
end)
vim.keymap.set('n', '<space>q', function()
    vsc.action('workbench.action.problems.focus', {})
end)

vim.keymap.set("x", "gc", "<Plug>VSCodeCommentary")
vim.keymap.set("n", "gc", "<Plug>VSCodeCommentary")
vim.keymap.set("o", "gc", "<Plug>VSCodeCommentary")
vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine")
