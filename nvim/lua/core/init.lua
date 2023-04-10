local load_core = function()
	require("core.basic")
	require("core.setup")
	require("ui.lualine")
	require("tool.project")
	require("core.keymap")
	
	vim.api.nvim_command("colorscheme " .. "gruvbox")
end
load_core()  