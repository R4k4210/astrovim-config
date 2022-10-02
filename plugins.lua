local plugins = {
  init = {
    -- You can disable default plugins as follows:
    -- ["goolord/alpha-nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
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
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd.with {
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "css",
          "scss",
          "html",
          "json",
          "yaml",
          "markdown",
          "md",
          "txt",
          "astro",
        },
      },
    }
    -- set up null-ls's on_attach function
    -- NOTE: You can uncomment this on attach function to enable format on save
    config.on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          pattern = "<buffer>",
          callback = vim.lsp.buf.formatting_sync,
        })
      end
    end
    return config -- return final config table to use in require("null-ls").setup(config)
  end,
  treesitter = { -- overrides `require("treesitter").setup(...)`
    ensure_installed = { "lua", "css", "json", "tsx", "typescript" },
  },
  -- use mason-lspconfig to configure LSP installations
  ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
    ensure_installed = { "sumneko_lua", "tsserver", "tailwindcss" },
  },
  -- use mason-tool-installer to configure DAP/Formatters/Linter installation
  ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
    ensure_installed = { "prettierd", "stylua" },
  },
  packer = { -- overrides `require("packer").setup(...)`
    compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
  },
}

return plugins
