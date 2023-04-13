return {
  {
    "nvim-treesitter/nvim-treesitter", -- overrides `require("treesitter").setup(...)`
    ensure_installed = {
      "lua",
      "css",
      "json",
      "tsx",
      "typescript",
      "scss",
      "solidity",
      "java",
      "c",
      "markdown",
      "javascript",
      "yaml",
    },
    matchup = {
      enable = true,
    },
  },
}
