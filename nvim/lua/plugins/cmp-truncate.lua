return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.formatting = vim.tbl_deep_extend("force", opts.formatting or {}, {
        format = function(entry, item)
          local max_abbr = 30
          local max_menu = 15

          item.abbr = (vim.fn.strdisplaywidth(item.abbr) > max_abbr)
              and (vim.fn.strcharpart(item.abbr, 0, max_abbr - 1) .. "…")
            or item.abbr

          if item.menu then
            item.menu = (vim.fn.strdisplaywidth(item.menu) > max_menu)
                and (vim.fn.strcharpart(item.menu, 0, max_menu - 1) .. "…")
              or item.menu
          end

          return item
        end,
      })

      opts.window = opts.window or {}
      opts.window.documentation = vim.tbl_deep_extend("force", opts.window.documentation or {}, {
        max_height = 20,
        max_width = 40,
      })
    end,
  },
}
