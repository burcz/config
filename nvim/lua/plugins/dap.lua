return {
  "mfussenegger/nvim-dap",
  recommended = true,
  desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
  },
  opts = function()
  local dap = require("dap")
  if not dap.adapters["pwa-node"] then
    require("dap").adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = { "/Users/szabo/.dap-servers/js-debug/src/dapDebugServer.js", "${port}", },
      },
    }
  end
  if not dap.adapters["node"] then
    dap.adapters["node"] = function(cb, config)
      if config.type == "node" then
        config.type = "pwa-node"
      end
      local nativeAdapter = dap.adapters["pwa-node"]
      if type(nativeAdapter) == "function" then
        nativeAdapter(cb, config)
      else
        cb(nativeAdapter)
      end
    end
  end

  local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

  local vscode = require("dap.ext.vscode")
  vscode.type_to_filetypes["node"] = js_filetypes
  vscode.type_to_filetypes["pwa-node"] = js_filetypes

  for _, language in ipairs(js_filetypes) do
    if not dap.configurations[language] then
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
          {
            name = "medical-admin-backend",
            type = "pwa-node",
            request = "attach",
            port = 10004,
            cwd = "${workspaceFolder}",
            localRoot = "${workspaceRoot}/packages/medical-admin-backend",
            remoteRoot = "${workspaceRoot}/packages/medical-admin-backend",
            sourceMaps = true,
            stopOnEntry = true
          },
      }
    end
  end
end,

  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })


--    -- setup dap config by VsCode launch.json file
--    local vscode = require("dap.ext.vscode")
--    local json = require("plenary.json")
--    vscode.json_decode = function(str)
--      return vim.json.decode(json.json_strip_comments(str))
--    end
  end,
}
