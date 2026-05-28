return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    cond = not vim.g.vscode,
    opts = {
        terminal = {
            provider = "none",
        },
    },
    keys = {
        { "<leader>cc",  nil,                        desc = "AI/Claude Code" },
        { "<leader>ccb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
        { "<leader>ccs", "<cmd>ClaudeCodeSend<cr>",  mode = "v",                 desc = "Send to Claude" },
    },
}
