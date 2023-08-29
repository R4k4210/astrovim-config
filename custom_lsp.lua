return {
  formatting = {
    format_on_save = true,
    timeout_ms = 1000, -- default format timeout
  },
  -- enable servers that you already have installed without mason
  servers = {
    -- "solidity",
    -- "pyright"
  },
  config = {
    -- solidity = function()
    --   -- local root_patterns = { "package.json" }
    --   -- local root_dir = lspconfig_util.root_pattern(root_patterns)
    --   local lspconfig = require "lspconfig"
    --
    --   return {
    --     cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
    --     filetypes = { "solidity" },
    --     root_dir = lspconfig.util.find_git_ancestor,
    --     single_file_support = true,
    --   }
    -- end,
  },
}
