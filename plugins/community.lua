return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.color.modes-nvim" },
  { import = "astrocommunity.media.pets-nvim" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
