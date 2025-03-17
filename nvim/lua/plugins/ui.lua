return {
    { "EdenEast/nightfox.nvim" },
    { "Mofiqul/vscode.nvim" },
    { "folke/tokyonight.nvim", lazy = false },
    { "sainnhe/gruvbox-material", lazy = false },
    { "rebelot/kanagawa.nvim", lazy = false },
    { -- set colorscheme
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
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
