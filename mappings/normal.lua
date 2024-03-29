local normal = {
  -- Examples
  -- second key is the lefthand side of the map
  -- mappings seen under group name "Buffer"
  -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
  -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
  -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
  -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
  -- quick save
  -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

  -- Delete word backwards
  ["dw"] = { "dvb", desc = "delete word backwards" },
  -- Lazydocker
  ["<leader>md"] = {
    function()
      require("toggleterm.terminal").Terminal
        :new({
          cmd = "lazydocker",
          direction = "float",
          hidden = true,
        })
        :toggle()
    end,
    desc = "Lazydocker",
  },
  -- Move code
  ["<M-k>"] = { "<cmd>m .-2<CR>", desc = "move line up" },
  ["<M-j>"] = { "<cmd>m .+1<CR>", desc = "move line down" },
  -- Taglist
  ["<leader>tt"] = { "<cmd>TlistToggle<cr>", desc = "Sort by tabs" },
  -- Move between buffers
  L = {
    function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Next buffer",
  },
  H = {
    function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    desc = "Previous buffer",
  },
  -- Diffview // overrides default diff
  ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
  ["<leader>gD"] = { "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
}

return normal
