local normal = {
  -- second key is the lefthand side of the map
  -- mappings seen under group name "Buffer"
  ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
  ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
  ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
  ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
  -- quick save
  -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

  -- Delete word backwards
  ["dw"] = { "dvb", desc = "delete word backwards" },
  -- Lazydocker
  ["<leader>md"] = {
    function()
      require("toggleterm.terminal").Terminal:new({ cmd = "lazydocker", direction = "float",
        hidden = true }):
          toggle()
    end,
    desc = "Lazydocker",
  },
  -- Move code
  ["<A-k>"] = { "<cmd>m .-2<CR>", desc = "move line up" },
  ["<A-j>"] = { "<cmd>m .+1<CR>", desc = "move line down" },
  -- Taglist
  ["<leader>tt"] = { "<cmd>TlistToggle<cr>", desc = "Sort by tabs" },

}

return normal
