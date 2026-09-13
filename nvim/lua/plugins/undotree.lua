return {
  {
    "jiaoshijie/undotree",
    opts = {
      layout = "left_bottom",
      position = "left",
      parser = "compact",
      window = {
        width = 0.25,
        height = 0.25,
        border = "rounded",
      },
    },
    keys = {
      {
        "<leader>u",
        function()
          require("undotree").toggle()
        end,
        desc = "Toggle Undo Tree",
      },
    },
  },
}
