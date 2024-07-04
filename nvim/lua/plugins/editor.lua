-- 输入/跳转功能插件

return {
    -- Markdown 表格模式
    {
        "dhruvasagar/vim-table-mode",
        config = function()
            vim.g.table_mode_corner = "|"
        end,
        cmd = { "TableModeToggle" },
        keys = { { "<leader>ut", "<cmd>TableModeToggle<cr>", desc = "Table mode" } },
    },

    -- 无延迟的使用jk退出Insert模式
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    -- Paste image
    {
        "yqwu905/clipboard-image.nvim",
        opts = {
            img_dir = "assets",
            img_dir_txt = "assets",
        },
    },

    -- Change surrounding
    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsc",
                update_n_lines = "gsn",
            },
        },
    },

    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {}
    }
}
