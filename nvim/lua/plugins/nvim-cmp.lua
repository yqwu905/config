local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })

local luasnip = require("luasnip")

return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        return {
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<S-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- that way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
            formatting = {
                format = function(_, item)
                    local icons = require("lazyvim.config").icons.kinds
                    if icons[item.kind] then
                        item.kind = icons[item.kind] .. item.kind
                    end
                    return item
                end,
            },
            experimental = {
                ghost_text = {
                    hl_group = "CmpGhostText",
                },
            },
            sorting = {
                priority_weight = 1.0,
                comparators = {
                    -- compare.score_offset, -- not good at all
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
                    cmp.config.compare.offset,
                    cmp.config.compare.order,
                    -- compare.scopes, -- what?
                    -- compare.sort_text,
                    -- compare.exact,
                    -- compare.kind,
                    -- compare.length, -- useless
                },
            },
        }
    end,
    ---@param opts cmp.ConfigSchema
    config = function(_, opts)
        for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1
        end
        require("cmp").setup(opts)

        vim.api.nvim_create_autocmd("ModeChanged", {
            group = unlinkgrp,
            pattern = { "s:n", "i:*" },
            desc = "Forget the current snippet when leaving the insert mode",
            callback = function(evt)
                if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
                    luasnip.unlink_current()
                end
            end,
        })
    end,
}
