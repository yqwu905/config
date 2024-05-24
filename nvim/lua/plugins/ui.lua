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
    { "rose-pine/neovim", name = "rose-pine" },
    { "EdenEast/nightfox.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "sainnhe/gruvbox-material" },
    { "projekt0n/github-nvim-theme" },
    { "sainnhe/everforest" },
    { "Mofiqul/vscode.nvim" },
    { "olimorris/onedarkpro.nvim" },
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
}
