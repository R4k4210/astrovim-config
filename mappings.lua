-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
--
-- local debugger = require "user.mappings.debugger"

-- local mapping_tables = { debugger };
--
-- local function get_mapping(table)
--         for index, data in ipairs(table) do
--                 print(index, data)
--
--                 for key, value in pairs(data) do
--                         print('\t', key, value)
--                 end
--         end
-- end
--
local terminal = require "user.mappings.terminal"
local insert = require "user.mappings.insert"
local normal = require "user.mappings.normal"
local visual = require "user.mappings.visual"

return {
  -- first key is the mode
  n = normal,
  i = insert,
  t = terminal,
  v = visual,
}

-- asdfasdf
