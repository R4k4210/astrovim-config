return {
  setup = function()
    local dap = require "dap"

    dap.set_log_level "TRACE"

    -- ADAPTERS
    dap.adapters.node2 = function(cb, config)
      if config.preLaunchTask then vim.fn.system(config.preLaunchTask) end
      local adapter = {
        type = "executable",
        command = "node",
        args = {
          os.getenv "HOME" .. "/_dev/DAP/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
        },
      }
      cb(adapter)
    end

    dap.adapters.yarn = {
      type = "executable",
      command = "yarn",
      args = {
        "node",
        os.getenv "HOME" .. "/_dev/DAP/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
      },
    }

    -- LAUNCHERS

    local node2 = {
      name = "Launch node",
      type = "node2",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    }

    local node_attach = {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = "Attach to node process",
      type = "node2",
      request = "attach",
      processId = require("dap.utils").pick_process,
    }

    dap.configurations.javascript = { node2, node_attach }
    dap.configurations.javascriptreact = {
      node2,
      node_attach,
    }

    dap.configurations.typescript = { node2, node_attach }
    dap.configurations.typescriptreact = {
      node2,
      node_attach,
    }

    -- get notify
    local function start_session(_, _)
      local info_string = string.format("%s", dap.session().config.program)
      vim.notify(info_string, "debug", { title = "Debugger Started", timeout = 500 })
    end
    local function terminate_session(_, _)
      local info_string = string.format("%s", dap.session().config.program)
      vim.notify(info_string, "debug", { title = "Debugger Terminated", timeout = 500 })
    end
    dap.listeners.after.event_initialized["dapui"] = start_session
    dap.listeners.before.event_terminated["dapui"] = terminate_session
    -- Define symbols
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
  end,
}
