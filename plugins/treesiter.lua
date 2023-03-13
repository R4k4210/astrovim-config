return {
  {
    "nvim-treesitter/nvim-treesitter", -- overrides `require("treesitter").setup(...)`
    ensure_installed = { "lua", "css", "json", "tsx", "typescript", "scss", "solidity" },
  },
}
