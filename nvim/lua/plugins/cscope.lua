return {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
        "folke/which-key.nvim",          -- optional [for whichkey hints]
        "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
        "nvim-tree/nvim-web-devicons",   -- optional [for devicons in telescope or fzf]
    },
    keys = { "<C-c>" },
    cmd = { "Cscope" },
    init = function()
        vim.api.nvim_create_user_command("CscopeBuild", function()
            pcall(function()
                os.execute("fd -e c -e h -E output -E test > cscope.files")
                vim.cmd("Cscope db build")
            end)
        end, {})
    end,
    opts = {
        disable_maps = false,
        skip_input_prompt = false, -- "true" doesn't ask for input
        prefix = "<C-c>",          -- prefix to trigger maps
        cscope = {
            picker = "telescope",
        },
    },
}
