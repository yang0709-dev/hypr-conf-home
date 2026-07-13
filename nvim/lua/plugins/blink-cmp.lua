return {
  "saghen/blink.cmp",
  opts = {
    -- 1. Disable Ghost Text (Correctly nested inside completion)
    completion = {
      ghost_text = {
        enabled = false,
      },
    },

    -- 2. Keymap Configuration
    keymap = {
      -- Disable default Enter (<CR>) behavior in the completion menu
      -- Setting to an empty table {} prevents blink.cmp from handling it
      ["<CR>"] = {},

      -- Map Ctrl+Enter to select_and_accept
      -- "fallback" ensures it acts as a normal newline if the menu is hidden
      ["<C-CR>"] = { "select_and_accept", "fallback" },
    },
  },
}
