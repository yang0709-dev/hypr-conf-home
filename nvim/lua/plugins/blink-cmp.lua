return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
      documentation = {
        auto_show = false,
      },
    },
    signature = {
      enabled = false,
    },

    keymap = {
      -- disables enter to select code suggestion and changes it to ctrl+enter
      ["<CR>"] = {},
      ["<A-y>"] = { "select_and_accept", "fallback" },

      -- disables up/down to select the suggesions and changes it to ctrl+arrow
      ["<Up>"] = {},
      ["<A-k>"] = { "select_prev", "fallback" },
      ["<Down>"] = {},
      ["<A-j>"] = { "select_next", "fallback" },
    },
  },
}
