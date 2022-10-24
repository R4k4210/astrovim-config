local polish = function()
  -- Set key binding
  -- Set autocommands
  -- vim.api.nvim_create_augroup("packer_conf", { clear = true })
  -- vim.api.nvim_create_autocmd("BufWritePost", {
  --   desc = "Sync packer after modifying plugins.lua",
  --   group = "packer_conf",
  --   pattern = "plugins.lua",
  --   command = "source <afile> | PackerSync",
  -- })

  vim.api.nvim_create_autocmd("CursorHold", {
    desc = "Show diagnostics on CursorHold",
    pattern = "*",
    callback = function() vim.diagnostic.open_float(nil, { focus = false }) end,
  })

  vim.api.nvim_create_autocmd("CursorHoldI", {
    desc = "Show diagnostics on CursorHold",
    pattern = "* !silent",
    callback = function() vim.lsp.buf.signature_help() end,
  })

  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }
  vim.filetype.add {
    extension = {
      astro = "astro",
    },
  }

  -- Solve lazygit problems
  -- vim.keymap.del("t", "<esc>")
  -- vim.keymap.del("t", "jk")
end

return polish
