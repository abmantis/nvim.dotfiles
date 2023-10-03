return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require('lualine').setup({
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'filename', newfile_status = true, path = 1, }, 'diagnostics' },
        lualine_c = {},
        lualine_x = { 'fileformat', { 'filetype', icon_only = true } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_c = { { 'filename', newfile_status = true, path = 1, } },
      }
    })
  end,
}
