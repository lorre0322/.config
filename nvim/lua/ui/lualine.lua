require("lualine").setup({
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { { "mode",color = { gui = "bold" } } },
    lualine_b = {
      'location',
      'progress',
    },
    lualine_c = {
      { 
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = "#ec5f67" },
          color_warn = { fg = "#ECBE7B" },
          color_info = { fg = "#008080" },
        }
      }
    },
    lualine_x = {},
    lualine_y = {
      "filesize",
      "filename",
    },
    lualine_z = {
      "encoding",
      {
        "fileformat",
        icons_enabled = true,
        symbols = {
          unix = "UNIX",
          dos = "CRLF",
          mac = "CR",
        },
      },
    },
  }
})