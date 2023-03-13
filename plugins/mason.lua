-- use mason-lspconfig to configure LSP installation
-- for solidity-ls (solidity) - remember to install solc compiler in the PATH.
-- https://docs.soliditylang.org/en/develop/installing-solidity.html
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "tsserver",
        "solidity",
        "emmet_ls", --[[ "tailwindcss" ]]
      },
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    ensure_installed = {
      "js-debug-adapter",
      "node-debug2-adapter",
      "java-debug-adapter",
      "java-test",
      "chrome-debug-adapter",
    },
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = { "prettierd", "prettier" },
    },
    config = function(_, opts)
      local mason_null_ls = require "mason-null-ls"
      local null_ls = require "null-ls"
      mason_null_ls.setup(opts)
      mason_null_ls.setup_handlers {
        taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
        prettierd = function()
          null_ls.register(
            null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "solidity", "md", "astro" } }
          )
        end,
      }
    end,
  },
}
