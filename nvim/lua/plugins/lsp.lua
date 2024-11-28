return {
    {
        "DNLHC/glance.nvim",
        opts = {
            border = {
                enable = true,
            },
        },
        cmd = "Glance",
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "yapf" },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "gd", "<cmd>Lspsaga peek_definition<cr>" }
            keys[#keys + 1] = { "gD", "<cmd>Lspsaga goto_definition<cr>" }
            keys[#keys + 1] = { "gh", "<cmd>Lspsaga finder<cr>" }
        end,
        opts = {
            inlay_hints = {
                enabled = true,
            },
        },
    },
    {
        "p00f/clangd_extensions.nvim",
        opts = {
            inlay_hints = {
                inline = true,
            },
        },
    },
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
        },
        keys = {
            { "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "incoming calls" },
            { "gh", "<cmd>Lspsaga finder<cr>", desc = "finder" },
        },
        cmd = { "Lspsaga" },
    },
}
