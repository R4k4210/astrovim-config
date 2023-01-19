return function()
  local dapvsjs = require "dap-vscode-js"
  local dap = require "dap"

  dap.set_log_level "TRACE"

  dapvsjs.setup {
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    -- debugger_path = os.getenv "HOME" .. "/_dev/DAP/microsoft/vscode-js-debug/out/src/vsDebugServer.js",
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
  }

  for _, language in ipairs { "typescript", "javascript", "typescriptreact", "javascriptreact" } do
    dap.configurations[language] = {
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-chrome",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }
  end
end
