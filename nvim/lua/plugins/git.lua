-- Git相关插件
return {
    -- Git blame信息
    {
        "FabijanZulj/blame.nvim",
        opts = {},
        cmd = { "BlameToggle" },
    },

    {
        "f-person/git-blame.nvim",
        opts = {},
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
        opts = {
            file_history_panel = {
                log_options = {
                    git = {
                        single_file = {
                            no_merges = true,
                        },
                        multi_file = {
                            no_merges = true,
                        },
                    },
                },
            },
        },
        lazy = true,
    },
}
