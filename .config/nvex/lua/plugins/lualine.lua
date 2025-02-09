return {
  "nvim-lualine/lualine.nvim",
  requires = { "nvim-tree/nvim-web-devicons", opt = true },
  -- setup = function()
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    lualine.setup({
      options = {
        theme = "catppuccin-macchiato",
        -- theme = "onedark",
        -- theme = "dracula",
        -- theme = "kanagawa",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {},
        globalstatus = false,
      },
      sections = {
        lualine_c = {
          { "buffers", show_filename_only = false },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          -- { "datetime", style = "%H:%M" },
          "fileformat",
          { "filetype", icon_only = true, align = "centre" },
          -- "encoding",
          "require'lsp-status'.status()",
        },
      },
    })
  end,
}
