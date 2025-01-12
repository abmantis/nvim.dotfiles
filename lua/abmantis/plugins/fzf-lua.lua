return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  cond = not vim.g.vscode,
  opts = {},
  config = function()
    local fzf_lua = require("fzf-lua")
    local my_utils = require('abmantis.utils')
    my_utils.setkeymap('n', '<leader>pf', fzf_lua.files, "Find Project Files")
    my_utils.setkeymap('n', '<leader>ps', fzf_lua.live_grep_native, "Project Search")
    my_utils.setkeymap('n', 'gr', fzf_lua.lsp_references, 'Goto References')
    my_utils.setkeymap('n', 'gI', fzf_lua.lsp_implementations, 'Goto Implementation')
    my_utils.setkeymap('n', '<leader>ds', fzf_lua.lsp_document_symbols, 'Document Symbols')
    my_utils.setkeymap('n', '<leader>ws', fzf_lua.lsp_live_workspace_symbols, 'Workspace Symbols')
    my_utils.setkeymap('n', '<space>q', fzf_lua.diagnostics_document, "Show file diagnostics")
  end
}
