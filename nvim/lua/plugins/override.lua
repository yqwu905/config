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
}
