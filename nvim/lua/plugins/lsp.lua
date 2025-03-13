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
            keys[#keys + 1] = { "<leader>ci", "<cmd>FzfLua lsp_incoming_calls<cr>" }
            keys[#keys + 1] = { "<leader>co", "<cmd>FzfLua lsp_outgoing_calls<cr>" }
        end,
        opts = {
            inlay_hints = {
                enabled = true,
            },
            servers = {
                clangd = {
                    -- single_file_support = false,
                    root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".clangd"),
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                        "--header-insertion=never",
                    },
                },
                bashls = {},
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
            { "gh", "<cmd>Lspsaga finder<cr>", desc = "finder" },
        },
        cmd = { "Lspsaga" },
    },
}
