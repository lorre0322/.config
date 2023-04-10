local edit = {}

-- 高亮
edit["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command("TSUpdate")
		end
	end,
	event = { "CursorHold", "CursorHoldI" },
	config = require("edit.treesitter"),
}
-- 注释
edit["windwp/nvim-autopairs"] = {
	lazy = true,
	event = "VeryLazy", 
	config = require("edit.autopairs")
}
-- 自动补全括号
edit["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("edit.comment"),
}


edit["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("edit.lsp"),
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ --美化
			"glepnir/lspsaga.nvim",
			event = "LspAttach",
			config = require("edit.lspsaga"),
		},
	},
}
edit["hrsh7th/nvim-cmp"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("edit.cmp"),
	dependencies = {
		-- 图标
		{ "onsails/lspkind.nvim" },
		{
			-- 显示
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("edit.luasnip"),
		},
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-path" },
-- 		{ "ray-x/cmp-treesitter" },
	},
}



-- edit["neovim/nvim-lspconfig"] = {
-- 	lazy = true,
-- 	event = { "BufReadPost", "BufAdd", "BufNewFile" },
-- 	config = require("edit.lsp"),
-- 	dependencies = {
-- 		{ "williamboman/mason.nvim" },
-- 		{ "williamboman/mason-lspconfig.nvim" },
-- 		{
-- 			"glepnir/lspsaga.nvim",
-- 			config = require("edit.lspsaga"),
-- 		},
-- 	},
-- }
-- edit["hrsh7th/nvim-cmp"] = {
-- 	lazy = true,
-- 	event = "InsertEnter",
-- 	config = require("edit.cmp"),
-- 	dependencies = {
-- 		{
-- 			"L3MON4D3/LuaSnip",
-- 			dependencies = { "rafamadriz/friendly-snippets" },
-- 			-- config = require("edit.luasnip"),
-- 		},
-- 		{ "saadparwaiz1/cmp_luasnip" },
-- 		{ "hrsh7th/cmp-nvim-lsp" },
-- 		{ "hrsh7th/cmp-nvim-lua" },
-- 		{ "hrsh7th/cmp-path" },
-- 		{ "ray-x/cmp-treesitter" },
-- 	},
-- }

return edit