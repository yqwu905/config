-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.spell = false
-- vim.opt.background = "light"

vim.cmd("set noswapfile")
vim.cmd("set nospell")
vim.cmd("set title")
vim.cmd("set colorcolumn=120")

vim.g.neovide_input_ime = false

vim.cmd("set encoding=utf8")
vim.cmd("set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030")

vim.g.snacks_animate = false
