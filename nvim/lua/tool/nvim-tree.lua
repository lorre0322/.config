return function()
require("nvim-tree").setup({
  auto_reload_on_write = true, 
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  respect_buf_cwd = false,
  sort_by = "name",
  sync_root_with_cwd = true,
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 25,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    hide_root_folder = false,
    float = {
      enable = false,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    full_name = true,
    highlight_opened_files = "yes",
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
    symlink_destination = true,
    indent_markers = {
      enable = true,
      icons = {
        corner = "╰ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    root_folder_label = ":.:s?.*?/..?",
    icons = {
      webdev_colors = true,
      git_placement = "before",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      padding = " ",
      symlink_arrow = "  ",
      glyphs = {
        default = "󰈙 ", --
        symlink = "󱪙 ", --
        bookmark = "󰷈 ",
        git = {
          unstaged = " ",
          staged = " ",
          unmerged = "שׂ ",
          renamed = " ", --
          untracked = "ﲉ ", -- "ﲉ"
          deleted = " ", --
          ignored = " ", --◌
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = " ",
          open = " ",
          empty = " ",
          empty_open = " ",
          symlink = "󱧬 ",
          symlink_open = " ",
        },
      },
    },
  }
})
end