return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',

      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      {
        'Joakker/lua-json5',
        build = './install.sh'
      }
    },
    keys = {
      {
        '<F5>',
        function()
          require('dap').continue()
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<F10>',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<F11>',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug: Step Into',
      },
      {
        '<F12>',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug: Step Out',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Debug: Toggle Breakpoint',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Conditional Breakpoint',
      },
    },
    config = function()
      local dap = require 'dap'

      require('mason-nvim-dap').setup {
        automatic_installation = false,
        handlers = {},
      }

      local dapvscode = require('dap.ext.vscode')
      dapvscode.json_decode = require('json5').parse
      dapvscode.load_launchjs()

      require("dap-python").setup("python3")
      table.insert(dap.configurations.python,
        {
          name = "Pytest: Current File",
          type = "python",
          request = "launch",
          module = "pytest",
          args = function()
            local args = {
              "${file}",
              "-sv",
              "--log-cli-level=INFO",
              "--log-file=test_out.log",
            }
            local filter = vim.fn.input('Test filter: ')
            if filter ~= '' then
              table.insert(args, '-k')
              table.insert(args, filter)
            end
            return args
          end,
          console = "integratedTerminal",
        })


      -- Change breakpoint icons
      vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
      vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
      local breakpoint_icons = {
        Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = ''
      }
      for type, icon in pairs(breakpoint_icons) do
        local tp = 'Dap' .. type
        local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
        vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
  {
    "miroshQa/debugmaster.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dm = require("debugmaster")
      vim.keymap.set({ "n", "v" }, "<leader>dd", dm.mode.toggle, { nowait = true })
    end
  }
}
