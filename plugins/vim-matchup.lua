return{
  "andymass/vim-matchup", 
  lazy = false,
  setup = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end
}

