return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
      filter = function(n)
        if n.msg == "No information available" then
          return false
        end
        return true
      end,
    },
    picker = {
      enabled = true,
      layout = {
        fullscreen = true,
      },
      formatters = {
        file = {
          truncate = 100,
        }
      }
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = {
      enabled = false, -- disable for now since it is causing issues with cursor position
      animate = {
        duration = { step = 15, total = 100 },
      },
      animate_repeat = {
        delay = 50, -- delay in ms before using the repeat animation
      },
    },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    { "<leader>pv",      function() Snacks.explorer({ layout = { fullscreen = false } }) end,    desc = "File Explorer" },
    -- find
    { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
    -- git
    { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
    -- Grep
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
    { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
    { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
    { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    -- Other
    { "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
    { "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
    { "<leader>.",       function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
    { "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
    { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
    { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
    { "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",               mode = { "n", "v" } },
    { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
    { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
    { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
    { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
    { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
    { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
          "<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })

    ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
    local progress = vim.defaulttable()
    vim.api.nvim_create_autocmd("LspProgress", {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params
            .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
          return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
          if i == #p + 1 or p[i].token == ev.data.params.token then
            p[i] = {
              token = ev.data.params.token,
              msg = ("[%3d%%] %s%s"):format(
                value.kind == "end" and 100 or value.percentage or 100,
                value.title or "",
                value.message and (" **%s**"):format(value.message) or ""
              ),
              done = value.kind == "end",
            }
            break
          end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
          return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
          id = "lsp_progress",
          title = client.name,
          opts = function(notif)
            notif.icon = #progress[client.id] == 0 and " "
                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
}
