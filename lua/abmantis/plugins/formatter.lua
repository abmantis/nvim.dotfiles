return {
    'mhartington/formatter.nvim',
    event = "VeryLazy",
    cond = not vim.g.vscode,
    config = function()
        require("formatter").setup {
            filetype = {
                -- python = {
                --     require("formatter.filetypes.python").black,
                -- },
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                    function()
                        -- Ignore already configured types.
                        local defined_types = require("formatter.config").values.filetype
                        if defined_types[vim.bo.filetype] ~= nil then
                            return nil
                        end
                        --
                        -- Call lsp formatter as a fallback
                        if vim.api.nvim_get_mode().mode == "v" then
                            vim.lsp.buf.format({
                                range = {
                                    ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                                    ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                                }
                            })
                        else
                            vim.lsp.buf.format({ async = false })
                        end
                    end,
                },
            },
        }
        local utils = require('abmantis.utils')
        utils.setkeymap('n', '<leader>cf', vim.cmd.Format, 'Code Format current buffer')
        utils.setkeymap('v', '<leader>cf', vim.cmd.Format, 'Code Format current selection')
    end
}
