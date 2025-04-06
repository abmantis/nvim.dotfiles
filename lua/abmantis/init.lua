-- detect if a directory was passed as argument and automatically cd into it
if vim.fn.argc() > 0 then
  local arg = vim.fn.argv(0)
  if vim.fn.isdirectory(arg) == 1 then
    vim.cmd("cd " .. arg)
  end
end

local fd_os_release = assert(io.open("/etc/os-release"), "r")
local s_os_release = fd_os_release:read("*a")
fd_os_release:close()
s_os_release = s_os_release:lower()
vim.g.is_nixos = s_os_release:match("nixos")

require("abmantis.remap")
require("abmantis.set")
require("abmantis.lazy")
require("abmantis.vscode")
