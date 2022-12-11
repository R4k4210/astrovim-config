local options = {
  opt = {
    relativenumber = true, -- sets vim.opt.relativenumber
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    -- Easy replace
    easy_replace_enable = 1,
    easy_replace_highlight_guibg = "blue",
    -- Taglist
    Tlist_Use_Right_Window = 1,
    Tlist_GainFocus_On_ToggleOpen = 1,
    Tlist_Auto_Update = 1,
  },
}

return options
