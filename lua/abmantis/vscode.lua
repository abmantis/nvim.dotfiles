if not vim.g.vscode then
    return
end

local vsc = require("vscode-neovim")

vim.keymap.set("n", "<leader>pv", function()
    vsc.notify('workbench.files.action.showActiveFileInExplorer', {})
end)

vim.keymap.set("n", "<leader>pf", function()
    vsc.notify('workbench.action.quickOpen', {})
end)

vim.keymap.set("n", "<leader>ps", function()
    vsc.notify('workbench.action.findInFiles', { query = vim.fn.expand("<cword>"), replace = '' })
end)

vim.keymap.set("x", "<leader>ps", function()
    vim.api.nvim_feedkeys('"py', 'n', false)
    vim.defer_fn(function()
        vsc.notify('workbench.action.findInFiles', { query = vim.fn.getreg('p'), replace = '' })
    end, 1)
end)

vim.keymap.set("x", "gc", "<Plug>VSCodeCommentary")
vim.keymap.set("n", "gc", "<Plug>VSCodeCommentary")
vim.keymap.set("o", "gc", "<Plug>VSCodeCommentary")
vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine")
