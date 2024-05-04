vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.cursorline = true
vim.opt.colorcolumn = "89"
vim.opt.termguicolors = true

vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

vim.o.exrc = true

vim.diagnostic.config({
  float = { source = "always" },
  virtual_text = { severity = { min = vim.diagnostic.severity.INFO } }
})

vim.opt.nu = true
vim.opt.relativenumber = true

-- Highlight on yank
vim.api.nvim_create_autocmd({ 'TextYankPost'}, {
  callback = function()
    vim.highlight.on_yank({higroup="IncSearch", timeout=500})
  end
})

if not vim.g.vscode then
  -- toggle relativenumber conditionally
  local auGroupUserRelNumberToggle = vim.api.nvim_create_augroup('UserRelNumberToggle', {})
  vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
    group = auGroupUserRelNumberToggle,
    callback = function()
      if vim.api.nvim_get_mode().mode == "i" then
        return
      end
      vim.opt.relativenumber = true
    end
  })
  vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
    group = auGroupUserRelNumberToggle,
    callback = function()
      vim.opt.relativenumber = false
    end
  })
end
