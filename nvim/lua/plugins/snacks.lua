-- interfaces like <leader>ff
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<A-j>"] = "list_down",
            ["<A-k>"] = "list_up",
          },
        },
      },
    },
  },
}
