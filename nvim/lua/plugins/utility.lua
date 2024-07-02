-- 提供独立功能的插件.

return {
    -- 持久高亮单词
    {
        "yqwu905/hi-my-words.nvim",
        opts = {},
        cmd = { "HiMyWordsToggle", "HiMyWordsClear" },
        keys = {
            { "#",          "<cmd>HiMyWordsToggle<cr>", desc = "Highlight word" },
            { "<leader>um", "<cmd>HiMyWordsClear<cr>",  desc = "Highlight word" },
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
            filesize = 2,      -- size of the file in Mb
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

    -- Doxgen
    {
        "vim-scripts/DoxygenToolkit.vim",
        cmd = { "Dox" }
    },

    -- Calltree plugin base on cscope
    {
        "yqwu905/cscope-calltree.nvim",
        dependencies = {
            { "MunifTanjim/nui.nvim" },
        },
        -- dir = "~/repos/cscope-calltree.nvim",
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
    {
        "letieu/jot.lua",
        opts = {},
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>fj",
                function()
                    require("jot").toggle()
                end,
                desc = "project note",
            },
        },
    },
    {
        "kawre/leetcode.nvim",
        cmd = { "Leet" },
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- telescope 所需
            "MunifTanjim/nui.nvim",

            -- 可选
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- 配置放在这里
            cn = {
                enabled = true,
            },
        },
    },
}
