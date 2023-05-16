return {
  "Exafunction/codeium.vim",
  lazy = false,
  config = function()
    vim.keymap.set("i", "<c-s>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
    vim.keymap.set("i", "<M-]>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    vim.keymap.set("i", "<M-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
  end,
}
