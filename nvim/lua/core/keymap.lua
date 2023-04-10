-- 设置主键为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
-- 定义pluginKeys对象
local pluginKeys = {}
map("i", "jk", "<ESC>",opt)
map("i", "K", "",opt)
map("n", "s", "", opt)

-- lsp
map("n", "g[", ":Lspsaga diagnostic_jump_prev", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "<C-[>", "<C-w>w", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 保存文件
map("i", "<C-s>", "<Esc>:w<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
-- 左右比例
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
map("n", "<C-w>", "<C-w>c", opt) -- 关闭当前
-- map("n", "<C-q>", "<C-w>o", opt) -- 关闭其他

-- comment 注释
pluginKeys.comment = {
  -- Normal模式
  toggler = {
    line = "<leader>n",
    block = "<leader>m",
  },
  -- Visual模式
  opleader = {
    line = "<leader>n",
    block = "<leader>m",
  }
}

-- 左右Tab切换
map("n", "<Tab>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Tab>l", ":BufferLineCycleNext<CR>", opt)
-- 关闭当前tab，使用了"moll/vim-bbye"
map("n", "<Tab>c", ":Bdelete!<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- nvim-tree
map("n", "<M-b>", ":NvimTreeToggle<CR>", opt)
map("n", "<M-Tab>", ":NvimTreeFocus<CR>", opt)
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  { key = "i", action = "cd" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "<Del>", action = "remove" },
  { key = "r", action = "rename" },
  { key = "d", action = "trash" },
  { key = "y", action = "copy" },
  { key = "p", action = "paste" },
  { key = "os", action = "system_open" },
}

-- telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fp", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-h>"] = "which_key",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}


return pluginKeys