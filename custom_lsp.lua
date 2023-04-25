return {
  formatting = {
    format_on_save = true,
    timeout_ms = 1000, -- default format timeout
  },
  -- enable servers that you already have installed without mason
  servers = {
    "nomicfoundation-solidity",
    -- "pyright"
  },
  config = {
    ["nomicfoundation-solidity"] = function()
      local lspconfig = require "lspconfig"
      local lspconfig_util = lspconfig.util
      local root_patterns = { "package.json" }
      local root_dir = lspconfig_util.root_pattern(root_patterns)

      return {
        filetypes = { "solidity" },
        cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        -- require("lspconfig.util").root_pattern "foundry.toml",
        root_dir = root_dir,
        single_file_support = true,
      }
    end,
  },
}
