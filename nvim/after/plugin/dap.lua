local dap, dapui = require("dap"), require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
--dap.listeners.before.event_terminated["dapui_config"] = function()
--  dapui.close({})
--end
--dap.listeners.before.event_exited["dapui_config"] = function()
--  dapui.close({})
--
--end

vim.keymap.set('n', '<leader>ui', require 'dapui'.toggle)
vim.keymap.set('n', '<leader>db', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>dr', require 'dap'.continue)

require("dap-vscode-js").setup({
  -- node_path = "pwa-node", -- Path of node executable. Defaults to $NODE_PATH, and then "pwa-node"
  --debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    --{
    --  type = "pwa-node",
    --  request = "launch",
    --  name = "Launch file",
    --  program = "${file}",
    --  cwd = "${workspaceFolder}",
    --},
        {
      name = "ch-analytics-frontend",
      type = "chrome",
      request = "launch",
      url = "http://localhost:3002",
      webRoot = "${workspaceRoot}/packages/cms-analytics-frontend",
      sourceMaps = true,
      trace = true,
      stopOnEntry = true
    },
    {
      name = "ch-external-backend",
      type = "pwa-node",
      request = "attach",
      port = 10008,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/ch-external-backend",
      remoteRoot = "${workspaceRoot}/packages/ch-external-backend",
      sourceMaps = true,
      stopOnEntry = true
    },
    {
      name = "ch-external-frontend",
      type = "chrome",
      request = "launch",
      url = "http://localhost:3000",
      webRoot = "${workspaceRoot}/packages/cms-external-frontend",
      sourceMaps = true,
      trace = true,
      stopOnEntry = true
    },
    {
      name = "ch-identity-backend",
      type = "pwa-node",
      request = "attach",
      port = 10009,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/ch-identity-backend",
      remoteRoot = "${workspaceRoot}/packages/ch-identity-backend",
      sourceMaps = true,
      stopOnEntry = true
    },
    {
      name = "ch-identity-frontend",
      type = "chrome",
      request = "launch",
      url = "http://localhost:3003",
      webRoot = "${workspaceRoot}/packages/cms-identity-frontend",
      sourceMaps = true,
      trace = true,
      stopOnEntry = true
    },
    {
      name = "ch-internal-backend",
      type = "pwa-node",
      request = "attach",
      port = 10010,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/ch-internal-backend",
      remoteRoot = "${workspaceRoot}/packages/ch-internal-backend",
      sourceMaps = true,
      stopOnEntry = true
    },
    {
      name = "ch-internal-frontend",
      type = "chrome",
      request = "launch",
      url = "http://localhost:3001",
      webRoot = "${workspaceRoot}/packages/cms-internal-frontend",
      sourceMaps = true,
      trace = true,
      stopOnEntry = true
    },
    {
      name = "cms-backend",
      type = "pwa-node",
      request = "attach",
      port = 10002,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/cms-backend",
      remoteRoot = "${workspaceRoot}/packages/cms-backend",
      sourceMaps = true,
      stopOnEntry = true
    },
    {
      name = "cms-frontend",
      type = "chrome",
      request = "launch",
      url = "http://localhost:3040",
      webRoot = "${workspaceRoot}/packages/cms-frontend",
      sourceMaps = true,
      trace = true,
      stopOnEntry = true
    },
    {
      name = "health-check-backend",
      type = "pwa-node",
      request = "attach",
      port = 10003,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/health-check-backend",
      remoteRoot = "${workspaceRoot}/packages/health-check-backend",
      sourceMaps = true,
      stopOnEntry = true
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
    {
      name = "medical-admin-frontend",
      type = "chrome",
      request = "launch",
      url = "http://localhost:4001",
      webRoot = "${workspaceRoot}/packages/medical-admin-frontend",
      sourceMaps = true,
      trace = true,
      stopOnEntry = true
    },
    {
      name = "medical-engine-api-gateway",
      type = "pwa-node",
      request = "attach",
      port = 10005,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/medical-engine-api-gateway",
      remoteRoot = "${workspaceRoot}/packages/medical-engine-api-gateway",
      sourceMaps = true,
      stopOnEntry = true
    },
    {
      name = "medical-engine-backend",
      type = "pwa-node",
      request = "attach",
      port = 10006,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/medical-engine-backend",
      remoteRoot = "${workspaceRoot}/packages/medical-engine-backend",
      sourceMaps = true,
      stopOnEntry = true
    },
    {
      name = "medical-services-backend",
      type = "pwa-node",
      request = "attach",
      port = 10007,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/medical-services-backend",
      remoteRoot = "${workspaceRoot}/packages/medical-services-backend",
      sourceMaps = true,
      stopOnEntry = true
    },
    {
      name = "medical-services-frontend",
      type = "chrome",
      request = "launch",
      url = "http://localhost:3100",
      webRoot = "${workspaceRoot}/packages/medical-services-frontend",
      sourceMaps = true,
      trace = true,
      stopOnEntry = true
    },
    {
      name = "web-app",
      type = "chrome",
      request = "launch",
      url = "http://localhost:4501",
      webRoot = "${workspaceRoot}/packages/web-app",
      sourceMaps = true,
      trace = true,
      stopOnEntry = true
    },
    {
      name = "ecosystem-management-backend",
      type = "pwa-node",
      request = "attach",
      port = 10011,
      cwd = "${workspaceFolder}",
      localRoot = "${workspaceRoot}/packages/ecosystem-management-backend",
      remoteRoot = "${workspaceRoot}/packages/ecosystem-management-backend",
      sourceMaps = true
    }

    --{
    --  type = "pwa-node",
    --  request = "launch",
    --  name = "Launch file",
    --  program = "${file}",
    --  cwd = "${workspaceFolder}",
    --},
    --{
    --  type = "pwa-node",
    --  request = "attach",
    --  name = "Attach",
    --  processId = require 'dap.utils'.pick_process,
    --  cwd = "${workspaceFolder}",
    --},
    --{
    --  type = "pwa-chrome",
    --  request = "launch",
    --  name = "Start Chrome with \"localhost\"",
    --  url = "http://localhost:3000",
    --  webRoot = "${workspaceFolder}",
    --  userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    --}
  }
end

