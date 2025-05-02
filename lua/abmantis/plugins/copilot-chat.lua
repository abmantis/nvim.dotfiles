return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },    -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken",       -- Only on MacOS or Linux
    cond = not vim.g.vscode,
    config = function()
      require('CopilotChat').setup({
        mappings = {
          complete = {
            insert = "<C-S-Space>",
          },
        },
        -- system_prompt = 'AmbrosioTest',
        context = 'file:.github/copilot-instructions.md',
        -- prompts = {
        --   AmbrosioTest = {
        --     system_prompt = require('CopilotChat.config.prompts').COPILOT_INSTRUCTIONS.system_prompt ..
        --         'Also add Ambrosio to how you identify yourself.',
        --   }
        -- }
      })
    end,
  },

  -- Blink integration
  {
    "saghen/blink.cmp",
    optional = true,
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        providers = {
          path = {
            -- Path sources triggered by "/" interfere with CopilotChat commands
            enabled = function()
              return vim.bo.filetype ~= "copilot-chat"
            end,
          },
        },
      },
    },
  },
}
