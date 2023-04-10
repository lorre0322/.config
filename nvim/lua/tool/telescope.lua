return function()

local lga_actions = require("telescope-live-grep-args.actions")  
require("telescope").setup({
  defaults = {
    initial_mode = "insert",
    prompt_prefix = "   "  .. " ",
    selection_caret = "  ",
    scroll_strategy = "limit",
    results_title = false,
    layout_strategy = "horizontal",
    path_display = { "absolute" },
    file_ignore_patterns = { ".git/", ".cache", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
    layout_config = {
      horizontal = {
        preview_width = 0.5,
      }, 
    },
    
  },
  extensions = {
    fzf = {
      fuzzy = false,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    frecency = {
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
    },

  }
})

require("telescope").load_extension("frecency")
require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")
-- require("telescope").load_extension("notify")
require("telescope").load_extension("projects")

end