return {
    {
        "yetone/avante.nvim",
        cmd = { "AvanteAsk", "AvanteAsk" },
        version = false,
        opts = {
            provider = "openai",
            auto_suggestions_provider = "openai",
            openai = {
                endpoint = "http://api.openai.rnd.huawei.com/v1",
                model = "qwq-32b",
                timeout = 30000, -- Timeout in milliseconds
                temperature = 0,
                max_tokens = 4096,
            },
        },
        build = "make",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
    },
}
