return {
    { -- catppuccin colorscheme
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
    },
    {
        "b0o/lavi.nvim",
        dependencies = { "rktjmp/lush.nvim" },
        priority = 1000,
    },
    { "EdenEast/nightfox.nvim" },
    { "Mofiqul/vscode.nvim" },
    { "folke/tokyonight.nvim", lazy = false },
    { "eldritch-theme/eldritch.nvim", lazy = false, priority = 1000, opts = {} },
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
