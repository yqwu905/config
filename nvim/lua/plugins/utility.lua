-- 提供独立功能的插件.

return {
    -- 持久高亮单词
    {
        "yqwu905/hi-my-words.nvim",
        opts = {},
        cmd = { "HiMyWordsToggle", "HiMyWordsClear" },
        keys = {
            { "#", "<cmd>HiMyWordsToggle<cr>", desc = "Highlight word" },
            { "<leader>um", "<cmd>HiMyWordsClear<cr>", desc = "Highlight word" },
        },
    },

    -- Quickfix 增强
    {
        "kevinhwang91/nvim-bqf",
        ft = { "qf" },
        dependencies = {
            {
                "junegunn/fzf",
                build = function()
                    vim.fn["fzf#install"]()
                end,
            },
        },
        opts = {},
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm" },
        opts = {},
        keys = {
            { "<A-h>", "<cmd>ToggleTerm<cr>", desc = "toggle term" },
        },
        config = function(_, opts)
            if vim.fn.has("linux") then
                vim.opt.shell = "zsh"
            end
            require("toggleterm").setup(opts)
        end,
    },

    -- 大文件禁用部分影响性能插件
    {
        "LunarVim/bigfile.nvim",
        opts = {
            filesize = 2, -- size of the file in Mb
            pattern = { "*" }, -- autocmd pattern
            features = {
                "indent_blankline",
                "illuminate",
                "lsp",
                "treesitter",
                "syntax",
                "matchparen",
                "vimopts",
                "filetype",
            },
        },
    },

    -- Bookmark plugin with ui
    {
        "otavioschwanck/arrow.nvim",
        opts = {
            show_icons = true,
            leader_key = ";", -- Recommended to be a single key
        },
    },

    -- Doxgen
    {
        "vim-scripts/DoxygenToolkit.vim",
    },

    -- Calltree plugin base on cscope
    {
        "yqwu905/cscope-calltree.nvim",
        dependencies = {
            { "MunifTanjim/nui.nvim" },
        },
        dir = "~/repos/cscope-calltree.nvim",
        opts = {},
        keys = {
            { "<leader>ci", "<cmd>CallerTree<cr>", desc = "caller tree" },
            { "<leader>co", "<cmd>CalleeTree<cr>", desc = "callee tree" },
        },
    },

    {
        dir = "~/repos/session-term.nvim/",
        dependencies = {
            { "MunifTanjim/nui.nvim" },
        },
        opts = {},
        keys = {
            { "<leader>o", "<cmd>SessionTerm<cr>", desc = "session term" },
        },
    },
}
