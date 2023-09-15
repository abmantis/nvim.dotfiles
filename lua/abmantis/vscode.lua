if not vim.g.vscode then
    return
end

vsc = require("vscode-neovim")

vim.keymap.set("n", "<leader>ps", function()
    vsc.notify('workbench.action.findInFiles', {query = vim.fn.expand("<cword>"), replace = ''})
end)
vim.keymap.set("x", "<leader>ps", function()
    vim.api.nvim_feedkeys('"py', 'n', false)
    vim.defer_fn(function ()
        vsc.notify('workbench.action.findInFiles', {query = vim.fn.getreg('p'), replace = ''})
    end, 1)
end)
