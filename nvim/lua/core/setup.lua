local fn, api = vim.fn, vim.api
local vim_path = vim.fn.stdpath("config")
local lazy_path = fn.stdpath("data") .. "lazy/lazy.nvim"
local plugin_path = vim_path .. "/lua"

local Lazy = {}
function Lazy:load_plugins()
	self.modules = {}
	local get_plugins_list = function()
		local list = {}
		local plugins_list = vim.split(fn.glob(plugin_path .. "/plugins/*.lua"), "\n")
		if type(plugins_list) == "table" then
			for _, f in ipairs(plugins_list) do
				list[#list + 1] = f:sub(#plugin_path +1, -1)
			end
		end
		return list
	end
  local plugins_file = get_plugins_list()
	for _, m in ipairs(plugins_file) do
		local modules = require(m:sub(0, #m - 4))
		if type(modules) == "table" then
			for name, conf in pairs(modules) do
				self.modules[#self.modules + 1] = vim.tbl_extend("force", { name }, conf)
			end
		end
	end

end

function Lazy:load_lazy()
	self:load_plugins()
	local lazy_settings = {
    git = {
			timeout = 300,
			url_format = "git@github.com:%s.git",
		},
    ui = {
			size = { width = 0.88, height = 0.8 },
			border = "rounded",
    }
  }
	require("lazy").setup(self.modules, lazy_settings)
end
Lazy:load_lazy()