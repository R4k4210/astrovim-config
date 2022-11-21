local custom_lsp = {
  formatting = {
    format_on_save = true,
    timeout_ms = 1000, -- default format timeout
  },
  -- enable servers that you already have installed without mason
  servers = {
    -- "pyright"
  },
  -- easily add or disable built in mappings added during LSP attaching
  mappings = {
    n = {
      -- ["<leader>lf"] = false -- disable formatting keymap
    },
  },

  -- Add overrides for LSP server settings, the keys are the name of the server
  ["server-settings"] = {
    -- astro = {
    -- on_attach = function(client, bufnr) client.server_capabilities.document_formatting = false end,
    -- },
  },
}

return custom_lsp
