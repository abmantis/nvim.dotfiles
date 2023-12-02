return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local navic = require("nvim-navic")
    require('lualine').setup({
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { 'filename', newfile_status = true, path = 0, },
          'diagnostics'
        },
        lualine_c = {},
        lualine_x = { 'fileformat', { 'filetype', icon_only = true } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_c = { { 'filename', newfile_status = true, path = 0, } },
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
