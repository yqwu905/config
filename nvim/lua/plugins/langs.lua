return {
    -- Markdown预览
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        -- config = function()
        --     vim.g.mkdp_theme = "light"
        -- end,
        ft = { "markdown" },
        cmds = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    },

    -- Json增强
    {
        "gennaro-tedesco/nvim-jqx",
        ft = { "json", "yaml" },
    },
}
