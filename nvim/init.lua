-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.colorcolumn = '120'
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.winborder = 'single'

vim.g.mapleader = ';'
vim.g.editorconfig = false

-- keymaps
vim.keymap.set('n', '<leader>v', function() vim.cmd[[vertical botright split]] end)
vim.keymap.set('n', '<leader>h', function() vim.cmd[[horizontal botright split]] end)
vim.keymap.set('n', '<leader>ch', function() vim.cmd[[
    horizontal botright 20split
    term
    tnoremap <Esc> <C-\><C-n>
]] end)
vim.keymap.set('n', '<leader>cv', function() vim.cmd[[
    vertical botright split
    term
    tnoremap <Esc> <C-\><C-n>
]] end)
vim.keymap.set('n', '<leader>cn', function() vim.cmd[[
    tab split
    term
    tnoremap <Esc> <C-\><C-n>
]] end)
vim.keymap.set('n', '<leader>crr', function() vim.cmd[[resize]] end)
vim.keymap.set('n', '<leader>crf', function() vim.cmd[[resize 20]] end)

vim.keymap.set('n', 'L', function() vim.cmd[[tabnext]] end)
vim.keymap.set('n', 'H', function() vim.cmd[[tabprev]] end)
vim.keymap.set('n', '<leader>n', function() vim.cmd[[tab split]] end)
vim.keymap.set('n', '<leader>w', function() vim.cmd[[tabclose]] end)
vim.keymap.set('n', '<leader>r', function() vim.cmd[[quitall!]] end)
vim.keymap.set('n', '<leader>e', function() vim.cmd[[Ex]] end)

--vim.keymap.set('n', '<C-l>', function() vim.cmd[[tabnext]] end)
--vim.keymap.set('n', '<C-h>', function() vim.cmd[[tabprev]] end)

-- Remap move keys
vim.keymap.set('n', 'J', ':m .+1<CR>==')
vim.keymap.set('n', 'K', ':m .-2<CR>==')
vim.keymap.set('v', 'J', ':m ">+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m "<-2<CR>gv=gv')

-- Remap Tmux Navigator
vim.keymap.set('n', '<C-h', function () vim.cmd[[TmuxNavigateLeft]] end)
vim.keymap.set('n', '<C-l', function () vim.cmd[[TmuxNavigateRight]] end)
vim.keymap.set('n', '<C-j', function () vim.cmd[[TmuxNavigateDown]] end)
vim.keymap.set('n', '<C-k', function () vim.cmd[[TmuxNavigateUp]] end)

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- imports
require('packages')
require('lsp')

-- leas important setup
-- require('one_monokai').setup({
--     transparent = true,
--     italics = true,
-- })
-- vim.cmd[[colorscheme one_monokai]]
require('onedarkpro').setup({
    styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "italic",
        strings = "italic",
        comments = "italic",
        keywords = "bold",
        constants = "bold,italic",
        functions = "NONE",
        operators = "NONE",
        variables = "NONE",
        parameters = "italic",
        conditionals = "italic",
        virtual_text = "NONE",
    },
    options = {
        cursorline = true,
        transparency = true,
    },
})
vim.cmd[[colorscheme onedark_vivid]]
