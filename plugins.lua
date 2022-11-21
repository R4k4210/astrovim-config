local catppuccin = require "user.plugins.catppuccin";

local plugins = {
  init = {
    -- You can disable default plugins as follows:
    -- ["rcarriga/nvim-notify"] = { disable = true },

    { "catppuccin/nvim", as = "catppuccin", config = catppuccin },

    ["nvim-telescope/telescope-dap.nvim"] = {
      module = "telescope._extensions.dap",
    },
    -- Easey replace
    { "kqito/vim-easy-replace" },

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
      -- null_ls.builtins.formatting.prettierd.with({
      --   extra_filetypes = { "solidity", "md", "astro" },
      --   filetypes = {
      --     "javascript",
      --     "typescript",
      --     "javascriptreact",
      --     "typescriptreact",
      --     "css",
      --     "scss",
      --     "html",
      --     "json",
      --     "yaml",
      --     "markdown",
      --     "md",
      --     "txt",
      --     "astro"
      --   },
      -- }),
    }
    return config -- return final config table to use in require("null-ls").setup(config)
  end,

  treesitter = { -- overrides `require("treesitter").setup(...)`
    ensure_installed = { "lua", "css", "json", "tsx", "typescript", "scss", "solidity" },
  },

  -- use mason-lspconfig to configure LSP installations
  ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
    ensure_installed = { "sumneko_lua", "tsserver", --[[ "tailwindcss" ]] --[[ "solidity", ]] --[[ "solc" ]] },
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
