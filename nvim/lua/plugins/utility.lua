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

    -- Doxgen
    {
        "vim-scripts/DoxygenToolkit.vim",
        cmd = { "Dox" },
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
        },
        opts = {
            -- 配置放在这里
            lang = "cpp",
            cn = {
                enabled = true,
            },
        },
    },

    {
        "HakonHarnes/img-clip.nvim",
        keys = { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        cmd = { "PasteImage" },
    },

    { "tiagovla/scope.nvim", config = true },

    { "session.nvim", dir = "~/repos/session.nvim/", opts = {} },
}
