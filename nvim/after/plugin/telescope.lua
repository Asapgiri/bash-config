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
    },
    defaults = {
        -- configure to use ripgrep
        vimgrep_arguments = {
            "rg",
            "--follow",        -- Follow symbolic links
            "--hidden",        -- Search for hidden files
            "--no-heading",    -- Don't group matches by each file
            "--with-filename", -- Print the file path with the matched lines
            "--line-number",   -- Show line numbers
            "--column",        -- Show column numbers
            "--smart-case",    -- Smart case search

            -- Exclude some patterns from search
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            -- needed to exclude some files & dirs from general search
            -- when not included or specified in .gitignore
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob=!**/.git/*",
                "--glob=!**/.idea/*",
                "--glob=!**/.vscode/*",
                "--glob=!**/build/*",
                "--glob=!**/dist/*",
                "--glob=!**/yarn.lock",
                "--glob=!**/package-lock.json",
            },
        },
    },
})
telescope.load_extension('ui-select')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', function() builtin.current_buffer_fuzzy_find(layout) end, {})
