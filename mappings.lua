-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local mappings = {
  -- first key is the mode
  n = {
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
        require("toggleterm.terminal").Terminal:new({ cmd = "lazydocker", direction = "float", hidden = true }):toggle()
      end,
      desc = "Lazydocker",
    },
    -- Move code
    ["<A-k>"] = { "<cmd>m .-2<CR>", desc = "move line up" },
    ["<A-j>"] = { "<cmd>m .+1<CR>", desc = "move line down" },

    -- Debugger
    ["<F9>"] = {
      function() require("dap").toggle_breakpoint() end,
      desc = "Toggle Breakpoint",
    },
    ["<leader>xb"] = {
      function() require("dap").set_breakpoint(vim.fn.input "Breakpoints condition: ") end,
      desc = "Breakpoint with condition",
    },
    ["<leader>xc"] = {
      function() require("dap").clear_breakpoints() end,
      desc = "Clear Breakpoints",
    },
    ["<F10>"] = {
      function() require("dap").continue() end,
      desc = "Continue",
    },
    ["<F11>"] = {
      function() require("dap").step_into() end,
      desc = "Step Into",
    },
    ["<F12>"] = {
      function() require("dap").step_over() end,
      desc = "Step Over",
    },
    ["<leader>xq"] = {
      function()
        require("dap").close()
        require("dapui").close()
      end,
      desc = "Close Session",
    },
    ["<leader>xQ"] = {
      function()
        require("dap").terminate()
        require("dapui").close()
      end,
      desc = "Terminate",
    },
    ["<leader>xu"] = {
      function() require("dapui").toggle() end,
      desc = "Toggle Debugger UI",
    },
    ["<leader>fdc"] = {
      function() require("telescope").extensions.dap.commands {} end,
      desc = "Commands",
    },
    ["<leader>fdC"] = {
      function() require("telescope").extensions.dap.configurations {} end,
      desc = "Configurations",
    },
    ["<leader>fdb"] = {
      function() require("telescope").extensions.dap.list_breakpoints {} end,
      desc = "Breakpoints",
    },
    ["<leader>fdv"] = {
      function() require("telescope").extensions.dap.variables {} end,
      desc = "Variables",
    },
    ["<leader>fdf"] = {
      function() require("telescope").extensions.dap.frames {} end,
      desc = "Frames",
    },
  },
  i = {
    -- navigate within insert mode
    ["<M-h>"] = { "<Left>", desc = "  move left" },
    ["<M-l>"] = { "<Right>", desc = " move right" },
    ["<M-j>"] = { "<Down>", desc = " move down" },
    ["<M-k>"] = { "<Up>", desc = " move up" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<A-j>"] = { ":m '>+1<cr>gv=gv" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv" },
  },
}

return mappings
