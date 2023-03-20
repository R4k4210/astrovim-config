return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.color.modes-nvim" },
  { import = "astrocommunity.media.pets-nvim" },
  { import = "astrocommunity.pack.java" },

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
