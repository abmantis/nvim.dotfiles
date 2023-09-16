-- Detect tabstop and shiftwidth automatically
return {
    'tpope/vim-sleuth',
    cond = not vim.g.vscode,
}
