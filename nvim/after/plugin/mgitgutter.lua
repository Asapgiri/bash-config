vim.cmd[[autocmd! gitgutter CursorHold,CursorHoldI]]

vim.api.nvim_create_autocmd({'TextChanged', 'TextChangedI'}, {
    callback = function(args) vim.cmd[[GitGutter]] end,
})
