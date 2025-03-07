return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            {
                "<leader>tt",
                function()
                    require("neotest").run.run()
                end,
                desc = "run nearest test",
            },
            {
                "<leader>tf",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "run nearest test",
            },
            {
                "<leader>tw",
                function()
                    require("neotest").watch.toggle()
                end,
                desc = "watch test",
            },
            {
                "<leader>ts",
                function()
                    require("neotest").summary.toggle()
                end,
                desc = "test summary",
            },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({}),
                    require("rustaceanvim.neotest"),
                },
            })
        end,
    },
}
