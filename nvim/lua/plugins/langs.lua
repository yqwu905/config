return {
    -- Markdown预览
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.g.mkdp_theme = "light"
        end,
        ft = { "markdown" },
        cmds = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    },

    {
        "OXY2DEV/markview.nvim",
        enabled = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
}
