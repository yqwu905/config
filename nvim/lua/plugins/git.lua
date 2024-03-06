-- Git相关插件
return {
    -- Git blame信息
    {
        "f-person/git-blame.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },

    -- Diffview
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewRefresh" },
        keys = {
            { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "diffview close" },
            { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", desc = "diffview current file" },
            { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "diffview history" },
            { "<leader>gdv", "<cmd>DiffviewOpen -uno<cr>", desc = "diffview" },
        },
        opts = {},
        lazy = true,
    },

    -- Neogit, 替代LazyGit
    {
        "NeogitOrg/neogit",
        opts = {},
        cmd = { "Neogit" },
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "neogit" },
        },
    },

    -- Fugitive
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gb", "<cmd>G blame<cr>", desc = "Blame" },
        },
        cmd = {
            "Git",
            "G",
            "Gstatus",
            "Gedit",
            "Gsplit",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GRename",
            "GDelete",
            "GRemove",
            "GBrowse",
        },
    },
}
