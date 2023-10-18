local polish = function()
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

  vim.api.nvim_create_augroup("matchup_matchparen_highlight", { clear = true })

  vim.api.nvim_create_autocmd("User", {
    desc = "Highlight MatchParen",
    pattern = "AstroColorScheme",
    group = "matchup_matchparen_highlight",
    callback = function() vim.cmd "highlight MatchParen ctermbg=blue guibg=lightblue cterm=italic gui=italic" end,
  })

  -- This is necessary for vim-prettier
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   desc = "Prettier solidity plugin",
  --   pattern = "*.sol",
  --   command = "Prettier"
  -- })

  -- This is not working, but will be good to use the global library
  -- vim.cmd([[
  --   let g:prettier#exec_cmd_path = "~/usr/lib/node_modules/prettier"
  -- ]])
  -- This au is not working because the file change externally and that generate problems
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   desc = "Prettier solidity on save",
  --   pattern = "*.sol",
  --   -- command = { "silent! !prettier --write 'contracts/**/*.sol' | redraw!" },
  --   callback = function()
  --     vim.cmd("silent !prettier --write 'contracts/**/*.sol'")
  --     vim.cmd("redraw!")
  --   end
  -- })

  vim.filetype.add {
    extension = {
      astro = "astro",
      solidity = "sol",
    },
  }
end

return polish
