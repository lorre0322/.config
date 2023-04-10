local tool = {}
-- 侧边导航
tool["nvim-tree/nvim-tree.lua"] = {
  lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = require("tool.nvim-tree")
}
-- 搜索工具
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"ahmedkhalf/project.nvim",
			event = "BufReadPost",
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {
			{ "kkharji/sqlite.lua" },
		} },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
}
return tool