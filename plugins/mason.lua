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
        "jdtls",
        "emmet_ls", --"tailwindcss"
      },
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    ensure_installed = {
      "js-debug-adapter",
      "node-debug2-adapter",
      "chrome-debug-adapter",
    },
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = { "prettierd", "prettier" },
      handlers = {
        -- prettier
        prettier = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                  or utils.root_has_file ".prettierrc"
                  or utils.root_has_file ".prettierrc.json"
                  or utils.root_has_file ".prettierrc.js"
            end,
          })
        end,
        -- prettierd
        require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
                or utils.root_has_file ".prettierrc"
                or utils.root_has_file ".prettierrc.json"
                or utils.root_has_file ".prettierrc.js"
          end,
        }),
      },
    },
  },
}
