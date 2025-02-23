return {
  'nvim-lualine/lualine.nvim',
  cond = not vim.g.vscode,
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local navic = require("nvim-navic")
    require('lualine').setup({
      options = {
        disabled_filetypes = {
          statusline = {
            -- "dap-repl",
            -- "dapui_breakpoints",
            -- "dapui_console",
            -- "dapui_scopes",
            -- "dapui_watches",
            -- "dapui_stacks",
          },
          winbar = {
            "dap-repl",
            "dapui_breakpoints",
            "dapui_console",
            "dapui_scopes",
            "dapui_watches",
            "dapui_stacks",
          },
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { 'filename', newfile_status = true, path = 1, },
          'diagnostics'
        },
        lualine_c = {},
        lualine_x = { 'fileformat', { 'filetype', icon_only = true } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_c = { { 'filename', newfile_status = true, path = 1, } },
      },
      winbar = {
        lualine_c = {
          {
            function()
              local loc = navic.get_location({
                click = true
              })
              if loc == "" then
                return ">"
              end
              return loc
            end,
            cond = function()
              return navic.is_available()
            end
          }
        }
      }
    })
  end,
}
