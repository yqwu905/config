-- 更改LazyVim插件的配置

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = "v",
                    node_decremental = "V",
                },
            },
        },
        autotag = {
            enable = true,
        },
    },

    {
        "ahmedkhalf/project.nvim",
        opts = {
            manual_mode = true,
            detection_methods = { "lsp", "pattern" },
            patterns = {
                ".git",
                ".mm",
            },
        },
    },

    {
        "ibhagwan/fzf-lua",
        opts = {
            { "default", winopts = { preview = { default = "bat" } } },
        },
    },
}
