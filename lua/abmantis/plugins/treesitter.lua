return {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    event = "BufRead",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "vim", "vimdoc" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
