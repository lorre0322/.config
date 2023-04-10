return function()

require("lspsaga").setup({
	preview = {
		lines_above = 1,
		lines_below = 17,
	},
	scroll_preview = {
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},
	request_timeout = 3000,
	finder = {
		keys = {
			jump_to = "e",
			edit = { "o", "<CR>" },
			vsplit = "s",
			split = "i",
			tabe = "t",
			quit = { "q", "<ESC>" },
			close_in_preview = "<ESC>",
		},
	},
	definition = {
		edit = "<C-c>o",
		vsplit = "<C-c>v",
		split = "<C-c>s",
		tabe = "<C-c>t",
		quit = "q",
	},
	code_action = {
		num_shortcut = true,
		keys = {
			quit = "q",
			exec = "<CR>",
		},
	},
	lightbulb = {
		enable = false,
		sign = true,
		enable_in_insert = true,
		sign_priority = 20,
		virtual_text = false,
	},
	diagnostic = {
		on_insert = true,
		on_insert_follow = false,
		show_code_action = true,
		show_virt_line = true,
		show_source = true,
		border_follow = true,
		jump_num_shortcut = true,
		keys = {
			exec_action = "<CR>",
			quit = "q",
			go_action = "g",
		},
	},
	rename = {
		quit = "<C-c>",
		mark = "x",
		confirm = "<CR>",
		exec = "<CR>",
		in_select = true,
	},
	outline = {
		win_position = "right",
		win_with = "_sagaoutline",
		win_width = 30,
		auto_preview = false,
		auto_refresh = true,
		auto_close = true,
		keys = {
			jump = "<CR>",
			expand_collapse = "u",
			quit = "q",
		},
	},
	symbol_in_winbar = {
		enable = false,
		hide_keyword = true,
		show_file = false,
		color_mode = true,
	},
	beacon = {
		enable = true,
		frequency = 12,
	},
	ui = {
		border = "double", -- Can be single, double, rounded, solid, shadow.
		winblend = 0,
		actionfix = "暈 ",
		expand = " ",
		collapse = " ",
		code_action = " ",
		incoming = " ",
		outgoing = " ",
	}
})

require('lspkind').init({
  mode = 'symbol_text',
  preset = 'codicons',
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
  },
})

end
