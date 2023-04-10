return function()

local setting = {
	options = {
			-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		-- 侧边栏配置
		-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
		offsets = {
			{
				filetype = "NvimTree",
				text = "  Finder",
				text_align = "center",
				padding = 1,
			},
		},
		number = nil,
		modified_icon = " ",
		buffer_close_icon = " ",
		left_trunc_marker = " ",
		right_trunc_marker = " ",
		max_name_length = 10,
		max_prefix_length = 10,
		tab_size = 20,
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = true,
		show_tab_indicators = true,
		enforce_regular_tabs = true,
		persist_buffer_sort = true,
		always_show_bufferline = true,
		separator_style = "thin",
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count)
			return "(" .. count .. ")"
		end,
	},
	highlights = {},
}
require("bufferline").setup(setting)

end
