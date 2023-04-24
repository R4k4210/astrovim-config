return {
  -- You can disable default plugins as follows:
  {
    "mfussenegger/nvim-dap",
    disable = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    disable = false,
  },
  {
    "rcarriga/nvim-notify",
    disable = true,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    module = "telescope._extensions.dap",
  },
  -- Easey replace
  { "kqito/vim-easy-replace", lazy = false },
  -- Solidity
  { "tomlion/vim-solidity" },
  -- Function list
  { "yegappan/taglist", lazy = false },
}
