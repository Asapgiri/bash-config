local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local function map_lsp_n(keys, lsp_func)
        vim.keymap.set('n', keys, lsp_func, { buffer = bufnr, remap = false })
    end
    local function map_lsp_v(keys, lsp_func)
        vim.keymap.set('v', keys, lsp_func, { buffer = bufnr, remap = false })
    end

    map_lsp_n('gd', vim.lsp.buf.definition)
    map_lsp_n('K', vim.lsp.buf.hover)
    map_lsp_n('<leader>2', vim.lsp.buf.references)
    map_lsp_n('<leader>3', vim.lsp.buf.rename)
    map_lsp_n('<leader>4', vim.lsp.buf.code_action)
    map_lsp_n(']d', vim.diagnostic.goto_next)
    map_lsp_n('[d', vim.diagnostic.goto_prev)
    map_lsp_n('<leader>x', vim.lsp.buf.format)
    map_lsp_v('<leader>x', vim.lsp.buf.format)
end)

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        --'bashls',
        'clangd',
        --'dockerls',
        'lemminx',
        'ltex',
        --'neocmake',
        'omnisharp',
        'pylsp',
        'texlab',
        'zls'
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cmake", "zig" },
    sync_install = false,
    auto_install = true
}
