local Util = require("lazyvim.util")

vim.api.nvim_create_user_command("WinDesktop", function()
    pcall(function()
        vim.cmd("Neotree dir=/mnt/c/Users/w30044123/Desktop/")
    end)
end, {})

return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        {
            "<leader>fe",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
            end,
            desc = "Explorer NeoTree (root dir)",
        },
        {
            "<leader>fE",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
        },
        {
            "<leader>fg",
            function()
                require("neo-tree.command").execute({ source = "git_status", toggle = true, dir = Util.root() })
            end,
            desc = "NeoTree Gitstatus (root dir)",
        },
        {
            "<leader>fG",
            function()
                require("neo-tree.command").execute({ source = "git_status", toggle = true, dir = vim.loop.cwd() })
            end,
            desc = "NeoTree Gitstatus (root dir)",
        },
        {
            "<leader>fb",
            function()
                require("neo-tree.command").execute({ source = "buffers", toggle = true, dir = Util.root() })
            end,
            desc = "NeoTree Gitstatus (root dir)",
        },
        {
            "<leader>fB",
            function()
                require("neo-tree.command").execute({ source = "buffers", toggle = true, dir = vim.loop.cwd() })
            end,
            desc = "NeoTree Gitstatus (root dir)",
        },
        { "<leader>e", "<cmd>Neotree toggle source=last<cr>", desc = "NeoTree toggle" },
    },
}
