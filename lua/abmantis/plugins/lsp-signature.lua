return {
    "ray-x/lsp_signature.nvim",
    cond = not vim.g.vscode,
    event = "InsertEnter",
    opts = {
        bind = true,
        handler_opts = {
            border = "rounded"
        }
    },
}
