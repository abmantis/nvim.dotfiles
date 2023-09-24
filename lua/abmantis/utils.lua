local my_utils= {}

my_utils.setkeymap = function(mode, keys, func, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set(mode, keys, func, opts)
end

return my_utils
