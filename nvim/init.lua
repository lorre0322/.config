local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if fn.empty(fn.glob(lazypath)) > 0 then
  vim.notify(" 󰺪 正在安装lazy.nvim，请稍后...")
  fn.system({
    "git",
    "clone",
    "git@github.com:folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  vim.notify(" 󰺦 安装lazy.nvim成功. ")
end
vim.opt.rtp:prepend(lazypath)
local statusOk, lazy = pcall(require, "lazy")
if not statusOk then
  vim.notify(" 󰺬 安装失败 ")
  return
else
	require("core")
end