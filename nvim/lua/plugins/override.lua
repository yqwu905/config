-- 更改LazyVim插件的配置

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            window = {
                mappings = {
                    ["o"] = "open",
                    ["v"] = "open_vsplit",
                    ["s"] = "open_split",
                },
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "gd", "<cmd>Glance definitions<cr>" }
            keys[#keys + 1] = { "gD", "<cmd>lua vim.lsp.buf.definition()<cr>" }
            keys[#keys + 1] = { "gh", "<cmd>Glance references<cr>" }
            keys[#keys + 1] = { "ci", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>" }
        end,
        opts = {
            servers = {
                clangd = {
                    single_file_support = false,
                    root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".clangd"),
                },
            },
        },
    },

    {
        "williamboman/mason.nvim",
        enabled = false,
    },

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

    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsc",
                update_n_lines = "gsn",
            },
        },
    },
}
