--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local mappings = require "user.mappings"
local plugins = require "user.plugins"
local updater = require "user.updater"
local custom_lsp = require "user.custom_lsp"
local polish = require "user.polish"
local options = require "user.options"
local highlights = require "user.highlights"
local header = require "user.header"
local default_theme = require "user.default_theme"

local config = {

  updater = updater, -- Configure AstroNvim updates

  colorscheme = "sonokai", -- Default: default_theme

  highlights = highlights,

  options = options,

  header = header, -- Set dashboard header

  default_theme = default_theme, -- Default theme configuration

  -- Diagnostics configuration (for vim.diagnostics.config({...}))
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = custom_lsp,

  mappings = mappings,

  -- Configure plugins
  plugins = plugins,

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = polish,
}

return config
