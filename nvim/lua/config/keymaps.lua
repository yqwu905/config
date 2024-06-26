-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local utils = require("config.utils")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map({ "n" }, "<leader>rr", utils.async_run_code, { desc = "Run" })
map({ "t" }, "<esc>", "<C-\\><C-n>", { desc = "Escape" })
map({ "i" }, "<C-a>", "<home>", { desc = "Line start" })
map({ "i" }, "<C-e>", "<end>", { desc = "Line end" })
map({ "i" }, "<C-v>", "<C-r>+", { desc = "Paster" })
