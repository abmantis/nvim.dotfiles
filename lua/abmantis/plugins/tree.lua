return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      update_focused_file = {
        enable = true,
      },
      view = {
        width = 45,
      },
    }
    local my_utils = require("abmantis.utils")
    my_utils.setkeymap("n", "<leader>pv", vim.cmd.NvimTreeFindFile, "Reveal file in file tree")
    my_utils.setkeymap("n", "<leader>tt", vim.cmd.NvimTreeToggle, "Toggle file tree")
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
