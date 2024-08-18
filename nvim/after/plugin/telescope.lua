local builtin = require('telescope.builtin')
local layout = require('telescope.themes').get_dropdown({
    previewer = true,
    layout_config = {
        width = 0.8,
        height = 0.6
    }
})

local telescope = require('telescope')
telescope.setup({
    extensions = {
        ['ui-select'] = { layout }
    }
})
telescope.load_extension('ui-select')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', function() builtin.current_buffer_fuzzy_find(layout) end, {})
