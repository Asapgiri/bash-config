require('plugins')

--vim.cmd[[colorscheme onedark]]
vim.cmd[[highlight Cursor guibg=grey]]

vim.opt.wrap = true
vim.cmd[[colorscheme one_monokai]]
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
--vim.opt.guicursor = 'n-v-c-i:block-Cursor'
vim.opt.cursorline = true
vim.opt.colorcolumn = '120'
vim.g.mapleader = ';'
vim.opt.mouse = ''
vim.opt.termguicolors = true
vim.g.editorconfig = false

vim.keymap.set("n", "<leader>t", function() vim.cmd[[tabnew]] end)
vim.keymap.set("n", "<leader>v", function() vim.cmd[[vsplit]] end)
vim.keymap.set("n", "<leader>h", function() vim.cmd[[split]] end)
vim.keymap.set("n", "<leader>c", function() vim.cmd[[split]] vim.cmd[[term]] end)
vim.keymap.set("n", "<leader>k", function() vim.cmd[[BufferNext]] end)
vim.keymap.set("n", "<leader>j", function() vim.cmd[[BufferPrev]] end)
vim.keymap.set("n", "<leader>e", function() vim.cmd[[BufferClose]] end)
vim.keymap.set("n", "<leader>r", function() vim.cmd[[quitall]] end)
vim.keymap.set("n", "<leader>w", function() vim.cmd[[Ex]] end)

-- Remap move keys
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
