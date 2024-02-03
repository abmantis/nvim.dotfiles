-- detect if a directory was passed as argument and automatically cd into it
if vim.fn.argc() > 0 then
  local arg = vim.fn.argv(0)
  if vim.fn.isdirectory(arg) == 1 then
    vim.cmd("cd " .. arg)
  end
end

require("abmantis.remap")
require("abmantis.set")
require("abmantis.lazy")
require("abmantis.vscode")
