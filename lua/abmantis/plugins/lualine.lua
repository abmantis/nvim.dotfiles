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
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', newfile_status = true, path = 1, } },
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
