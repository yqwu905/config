return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        config = true, -- This automatically runs `require("luarocks-nvim").setup()`
        opts = {
            rocks = { "magick" },
        },
        lazy = true,
    },
    -- { "3rd/image.nvim", dependencies = { "luarocks.nvim" }, opts = {} },
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        -- put any other flags you wanted to pass to lazy here!
        ft = { "norg" },
        cmd = { "Neorg" },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.ui.calendar"] = {},
                },
            })
        end,
    },
}
