-- =============================================================================
-- UNDOTREE (visual undo history)
-- WHAT: Visual view of undo history
-- REFERENCE: https://github.com/jiaoshijie/undotree
-- -----------------------------------------------------------------------------
return {
  'jiaoshijie/undotree',
  opts = {
    -- your options
  },
  keys = { -- load the plugin only when using it's keybinding:
    { '\\u', "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
