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
        "ahmedkhalf/project.nvim",
        opts = {
            manual_mode = true,
        },
        config = function(opts)
            require("project_nvim").setup(opts)
            vim.cmd("command! ProjectAddMuanually lua _ADD_CURR_DIR_TO_PROJECTS()")
        end,
    },

    {
        "ibhagwan/fzf-lua",
        opts = {
            { "default", winopts = { preview = { default = "bat" } } },
        },
    },
}
