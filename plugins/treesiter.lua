return {
  {
    "nvim-treesitter/nvim-treesitter", -- overrides `require("treesitter").setup(...)`
    -- fix dart slow down bug
    commit = "33eb472b459f1d2bf49e16154726743ab3ca1c6d",
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
