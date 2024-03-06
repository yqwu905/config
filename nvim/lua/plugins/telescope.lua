return {
    {
        "telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                version = "^1.0.0",
            },
        },
        keys = {
            { "<leader><space>", "<cmd>Telescope find_files<cr>", "find fiels" },
            { "<leader>slr", "<cmd>Telescope lsp_references<cr>", "find lsp references" },
        },
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "cscope.out",
                    "cscope.files",
                    "tags",
                    "output",
                    ".cache",
                },
            },
            extensions = {
                project = {
                    on_project_selected = function(prompt_bufner)
                        local action = require("telescope._extensions.project.actions")
                        local title = action.get_selected_title(prompt_bufner)
                        vim.o.titlestring = title
                        action.search_in_project_files(prompt_bufner)
                    end,
                },
            },
        },
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
            { "telescope.nvim" },
        },
        config = function()
            require("telescope").load_extension("project")
        end,
        keys = {
            {
                "<leader>fp",
                function()
                    require("telescope").extensions.project.project({})
                end,
                desc = "project",
            },
        },
    },
}
