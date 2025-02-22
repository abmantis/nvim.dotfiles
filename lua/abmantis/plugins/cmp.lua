-- Autocompletion
return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = 'rafamadriz/friendly-snippets',
  cond = not vim.g.vscode,

  -- use a release tag to download pre-built binaries
  version = 'v0.11',
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- On musl libc based systems you need to add this flag
  -- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'enter' },
    sources = {
      cmdline = {}
    },
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } }

    -- experimental signature help support
    -- trigger = { signature_help = { enabled = true } }
  }
}
-- return {
--     'hrsh7th/nvim-cmp',
--     cond = not vim.g.vscode,
--     event = "BufRead",
--     dependencies = {
--         -- Snippet Engine & its associated nvim-cmp source
--         'L3MON4D3/LuaSnip',
--         'saadparwaiz1/cmp_luasnip',
--
--         -- Adds LSP completion capabilities
--         'hrsh7th/cmp-nvim-lsp',
--
--         -- Adds a number of user-friendly snippets
--         'rafamadriz/friendly-snippets',
--     },
--     config = function()
--         local cmp = require 'cmp'
--         local luasnip = require 'luasnip'
--         require('luasnip.loaders.from_vscode').lazy_load()
--         luasnip.config.setup {}
--
--         cmp.setup {
--             snippet = {
--                 expand = function(args)
--                     luasnip.lsp_expand(args.body)
--                 end,
--             },
--             mapping = cmp.mapping.preset.insert {
--                 ['<C-n>'] = cmp.mapping.select_next_item(),
--                 ['<C-p>'] = cmp.mapping.select_prev_item(),
--                 ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--                 ['<C-u>'] = cmp.mapping.scroll_docs(4),
--                 ['<C-Space>'] = cmp.mapping.complete {},
--                 ['<C-e>'] = cmp.mapping.abort(),
--                 ['<CR>'] = cmp.mapping.confirm {
--                     -- behavior = cmp.ConfirmBehavior.Replace,
--                     select = true,
--                 },
--                 ['<Tab>'] = cmp.mapping(function(fallback)
--                     if luasnip.expand_or_locally_jumpable() then
--                         luasnip.expand_or_jump()
--                     else
--                         fallback()
--                     end
--                 end, { 'i', 's' }),
--                 ['<S-Tab>'] = cmp.mapping(function(fallback)
--                     if luasnip.locally_jumpable(-1) then
--                         luasnip.jump(-1)
--                     else
--                         fallback()
--                     end
--                 end, { 'i', 's' }),
--             },
--             sources = {
--                 { name = 'nvim_lsp' },
--                 { name = 'luasnip' },
--             }
--         }
--     end,
-- }
