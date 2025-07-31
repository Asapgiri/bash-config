vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd[[set completeopt+=fuzzy,noinsert,preview]]

vim.lsp.config('cmake', {
    init_options = {
        buildDirectory = "__build"
    }
})

vim.lsp.enable({
    'lua_ls',   -- Lua
    'ccls',     -- C
    'marksman', -- markdown
    'cmake',    -- cmake
    'pylsp',    -- python
})

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>2', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>3', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>4', vim.lsp.buf.code_action)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>x', vim.lsp.buf.format)
vim.keymap.set('v', '<leader>x', vim.lsp.buf.format)

-- Remap selection to Tab
vim.cmd[[inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"]]
