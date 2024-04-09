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
        cmds = { "MarkdownPreview", "MarkdownPreviewStop" },
    },

    -- Json增强
    {
        "gennaro-tedesco/nvim-jqx",
        ft = { "json", "yaml" },
    },

    -- Obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = { "markdown" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "work",
                    path = "~/note/",
                },
            },
            -- note_frontmatter_func = function(note) end,
            disable_frontmatter = true,
            -- see below for full list of options 👇
        },
    },
}
