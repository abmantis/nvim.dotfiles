return {
  "nvim-neo-tree/neo-tree.nvim",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(arg)
            vim.opt.relativenumber = true
          end,
        }
      },
    })

    local my_utils = require("abmantis.utils")

    my_utils.setkeymap("n", "<leader>pv",
      function()
        vim.cmd.Neotree("reveal")
      end, "Reveal file in file tree")

    my_utils.setkeymap("n", "<leader>tt", function()
      vim.cmd.Neotree("toggle")
    end, "Toggle file tree")
  end,
}
