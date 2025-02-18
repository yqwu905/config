return {
    { "EdenEast/nightfox.nvim" },
    { "Mofiqul/vscode.nvim" },
    { "folke/tokyonight.nvim", lazy = false },
    { -- set colorscheme
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    { -- Highlight current line with different color in different mode

        "mvllow/modes.nvim",
        opts = {},
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
    },
}
