return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
    --   " █████  ███████ ████████ ██████   ██████",
    --   "██   ██ ██         ██    ██   ██ ██    ██",
    --   "███████ ███████    ██    ██████  ██    ██",
    --   "██   ██      ██    ██    ██   ██ ██    ██",
    --   "██   ██ ███████    ██    ██   ██  ██████",
    --   " ",
    --   "    ███    ██ ██    ██ ██ ███    ███",
    --   "    ████   ██ ██    ██ ██ ████  ████",
    --   "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    --   "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    --   "    ██   ████   ████   ██ ██      ██",  
    [[                                                                     ]],
    [[       ███████████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      ████████████████ ███████████ ███   ███████     ]],
    [[     ████████████████ ████████████ █████ ██████████████   ]],
    [[    █████████████████████████████ █████ █████ ████ █████   ]],
    [[  ██████████████████████████████████ █████ █████ ████ █████  ]],
    [[ ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
    [[ ██████   ██  ███████████████   ██ █████████████████ ]],
    [[ ██████   ██  ███████████████   ██ █████████████████ ]],
-- "          .                                                      .",
-- "        .n                   .                 .                  n.",
-- "  .   .dP                  dP                   9b                 9b.    .",
-- " 4    qXb         .       dX                     Xb       .        dXp     t",
-- "dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb",
-- "9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP",
-- " 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP",
-- "  `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP'",
-- "    `9XXXXXXXXXXXP' `9XX'   DIE    `98v8P'  HUMAN   `XXP' `9XXXXXXXXXXXP'",
-- "        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~",
-- "                        )b.  .dbo.dP'`v'`9b.odb.  .dX(",
-- "                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.",
-- "                     dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb",
-- "                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb",
-- "                    9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP",
-- "                     `'      9XXXXXX(   )XXXXXXP      `'",
-- "                              XXXX X.`v'.X XXXX",
-- "                              XP^X'`b   d'`X^XX",
-- "                              X. 9  `   '  P )X",
-- "                              `b  `       '  d'",
-- "                               `             '"
    }
    dashboard.section.header.opts.hl = "DashboardHeader"

    local button = require("astronvim.utils").alpha_button
    dashboard.section.buttons.val = {
      button("LDR f f", "  Find File  "),
      button("LDR f o", "  Recents  "),
      button("LDR f w", "  Find Word  "),
      button("LDR f '", "  Bookmarks  "),
      button("LDR S l", "  Last Session  "),
      button("LDR n", "  New File  "),
    }

    dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
    dashboard.config.layout[3].val = 5
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
  config = require "plugins.configs.alpha",
}
