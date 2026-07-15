return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
    },

    keymap = {
      -- disables enter to select code suggestion and changes it to ctrl+enter
      ["<CR>"] = {},
      ["<C-CR>"] = { "select_and_accept", "fallback" },

      -- disables up/down to select the suggesions and changes it to ctrl+arrow
      ["<Up>"] = {},
      ["<C-Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = {},
      ["<C-Down>"] = { "select_next", "fallback" },
    },
  },
}
