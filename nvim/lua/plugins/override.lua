-- 更改LazyVim插件的配置
function _ADD_CURR_DIR_TO_PROJECTS()
    local historyfile = require("project_nvim.utils.path").historyfile
    local curr_directory = vim.fn.expand("%:p:h")
    vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
end

return {
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
        "ibhagwan/fzf-lua",
        opts = {
            { "default", winopts = { preview = { default = "bat" } } },
        },
    },

    {
        "akinsho/bufferline.nvim",
    },

    { "mason-org/mason.nvim", version = "^1.0.0" },
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },

    {
        "akinsho/bufferline.nvim",

        opts = {
            options = {
                diagnostics = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "thin",
                tab_size = 8,
                always_show_bufferline = true,
            },
        },
    },
}
