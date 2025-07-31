require('plugins')

--vim.cmd[[colorscheme onedark]]
vim.cmd[[highlight Cursor guibg=grey]]

-- vim.opt.wrap = true
-- vim.cmd[[colorscheme one_monokai]]
-- vim.opt.nu = true
-- vim.opt.relativenumber = true
-- vim.opt.tabstop = 4
-- vim.opt.expandtab = true
-- vim.opt.shiftwidth = 4
-- --vim.opt.guicursor = 'n-v-c-i:block-Cursor'
-- vim.opt.cursorline = true
-- vim.opt.colorcolumn = '120'
-- vim.g.mapleader = ';'
-- --vim.opt.mouse = ''
-- vim.opt.termguicolors = true
-- vim.g.editorconfig = false
-- vim.opt.clipboard = 'unnamed,unnamedplus'

vim.keymap.set("n", "<leader>v", function() vim.cmd[[vertical botright split]] end)
vim.keymap.set("n", "<leader>h", function() vim.cmd[[horizontal botright split]] end)
vim.keymap.set("n", "<leader>ch", function() vim.cmd[[
    horizontal botright 20split
    term
    tnoremap <Esc> <C-\><C-n>
]] end)
vim.keymap.set("n", "<leader>cv", function() vim.cmd[[
    vertical botright split
    term
    tnoremap <Esc> <C-\><C-n>
]] end)
vim.keymap.set("n", "<leader>cn", function() vim.cmd[[
    tab split
    term
    tnoremap <Esc> <C-\><C-n>
]] end)
vim.keymap.set("n", "<leader>crr", function() vim.cmd[[resize]] end)
vim.keymap.set("n", "<leader>crf", function() vim.cmd[[resize 20]] end)

--vim.keymap.set("n", "<leader>k", function() vim.cmd[[BufferNext]] end)
--vim.keymap.set("n", "<leader>j", function() vim.cmd[[BufferPrev]] end)
--vim.keymap.set("n", "<leader>e", function() vim.cmd[[BufferClose]] end)
vim.keymap.set("n", "<leader>n", function() vim.cmd[[tab split]] end)
--vim.keymap.set("n", "<leader>k", function() vim.cmd[[tabnext]] end)
--vim.keymap.set("n", "<leader>j", function() vim.cmd[[tabprev]] end)
vim.keymap.set("n", "L", function() vim.cmd[[tabnext]] end)
vim.keymap.set("n", "H", function() vim.cmd[[tabprev]] end)
vim.keymap.set("n", "<leader>w", function() vim.cmd[[tabclose]] end)
vim.keymap.set("n", "<leader>r", function() vim.cmd[[quitall!]] end)
vim.keymap.set("n", "<leader>e", function() vim.cmd[[Ex]] end)

--vim.keymap.set("n", "<C-l>", function() vim.cmd[[tabnext]] end)
--vim.keymap.set("n", "<C-h>", function() vim.cmd[[tabprev]] end)

-- Remap move keys
vim.keymap.set("n", "J", ":m .+1<CR>==")
vim.keymap.set("n", "K", ":m .-2<CR>==")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap Tmux Navigator
vim.keymap.set("n", "<C-h", function () vim.cmd[[TmuxNavigateLeft]] end)
vim.keymap.set("n", "<C-l", function () vim.cmd[[TmuxNavigateRight]] end)
vim.keymap.set("n", "<C-j", function () vim.cmd[[TmuxNavigateDown]] end)
vim.keymap.set("n", "<C-k", function () vim.cmd[[TmuxNavigateUp]] end)

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
