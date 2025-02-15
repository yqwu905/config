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

    -- Calltree plugin base on cscope
    {
        "yqwu905/cscope-calltree.nvim",
        dependencies = {
            { "MunifTanjim/nui.nvim" },
        },
        opts = {},
        keys = {
            { "<leader>cti", "<cmd>CallerTree<cr>", desc = "caller tree" },
            { "<leader>cto", "<cmd>CalleeTree<cr>", desc = "callee tree" },
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
        },
        opts = {
            -- 配置放在这里
            lang = "rust",
            cn = {
                enabled = true,
            },
        },
    },

    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvimtools/hydra.nvim",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                mode = { "v", "n" },
                "<Leader>m",
                "<cmd>MCstart<cr>",
                desc = "Create a selection for selected text or word under the cursor",
            },
        },
    },

    {
        "Vonr/align.nvim",
        branch = "v2",
        lazy = true,
        keys = {},
        init = function()
            local NS = { noremap = true, silent = true }

            -- Aligns to 1 character
            vim.keymap.set("x", "aa", function()
                require("align").align_to_char({
                    length = 1,
                })
            end, NS)

            -- Aligns to 2 characters with previews
            vim.keymap.set("x", "ad", function()
                require("align").align_to_char({
                    preview = true,
                    length = 2,
                })
            end, NS)

            -- Aligns to a string with previews
            vim.keymap.set("x", "aw", function()
                require("align").align_to_string({
                    preview = true,
                    regex = false,
                })
            end, NS)

            -- Aligns to a Vim regex with previews
            vim.keymap.set("x", "ar", function()
                require("align").align_to_string({
                    preview = true,
                    regex = true,
                })
            end, NS)

            -- Example gawip to align a paragraph to a string with previews
            vim.keymap.set("n", "gaw", function()
                local a = require("align")
                a.operator(a.align_to_string, {
                    regex = false,
                    preview = true,
                })
            end, NS)

            -- Example gaaip to align a paragraph to 1 character
            vim.keymap.set("n", "gaa", function()
                local a = require("align")
                a.operator(a.align_to_char)
            end, NS)
        end,
    },
}
