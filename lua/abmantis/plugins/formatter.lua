return {
    'mhartington/formatter.nvim',
    config = function()
        require("formatter").setup {
            filetype = {
                python = {
                    require("formatter.filetypes.python").black,
                },
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
                            vim.lsp.buf.format({ async = true })
                        end
                    end,
                },
            },
        }
        vim.keymap.set('n', '<leader>cf', vim.cmd.Format, { desc = 'Code Format current buffer' })
        vim.keymap.set('v', '<leader>cf', vim.cmd.Format, { desc = 'Code Format current selection' })
    end
}
