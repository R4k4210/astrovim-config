local plugins = {
  init = {
    -- You can disable default plugins as follows:
    ["rcarriga/nvim-notify"] = { disable = true },

    ["catppuccin/nvim"] = {
      as = "catppuccin",
      config = function()
        require("user.plugins.catppuccin")
      end
    },

    ["nvim-telescope/telescope-dap.nvim"] = {
      module = "telescope._extensions.dap",
    },
    -- Easey replace
    { "kqito/vim-easy-replace" },
    -- Solidity
    { "tomlion/vim-solidity" },
    -- Debugger
    { "mxsdev/nvim-dap-vscode-js" },
    { "mfussenegger/nvim-dap" },
    ["rcarriga/nvim-dap-ui"] = { config = function()
      require("user.plugins.nvim-dapui")
    end },
    -- Tabnine
  },
  -- All other entries override the require("<key>").setup({...}) call for default plugins
  ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    -- config variable is the default configuration table for the setup functino call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.prettier.with({
        bin = "prettierd",
        extra_filetypes = { "solidity", "md", "astro" },
      }),
    }
    return config -- return final config table to use in require("null-ls").setup(config)
  end,

  treesitter = { -- overrides `require("treesitter").setup(...)`
    ensure_installed = { "lua", "css", "json", "tsx", "typescript", "scss", "solidity" },
  },

  -- use mason-lspconfig to configure LSP installations
  -- for solidity-ls (solidity) - remember to install solc compiler in the PATH.
  -- https://docs.soliditylang.org/en/develop/installing-solidity.html
  ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
    ensure_installed = { "sumneko_lua", "tsserver", "solidity" --[[ "tailwindcss" ]] },
  },
  -- use mason-tool-installer to configure DAP/Formatters/Linter installation
  ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
    ensure_installed = { "prettierd", "prettier" },
  },
  packer = { -- overrides `require("packer").setup(...)`
    compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
  },
}

return plugins
