-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.has("wsl") then
    vim.g.clipboard = {
        name = "win32yank",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = 0,
    }
end

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.cmd("set noswapfile")
vim.cmd("set nospell")
vim.cmd("set title")
vim.cmd("set colorcolumn=120")

vim.g.neovide_input_ime = false

vim.cmd("set termencoding=utf-8")
vim.cmd("set encoding=utf8")
vim.cmd("set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030")
