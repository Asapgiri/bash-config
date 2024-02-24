require('plugins')

--vim.cmd[[colorscheme onedark]]
vim.cmd[[colorscheme one_monokai]]
vim.cmd[[highlight Cursor guibg=grey]]

vim.opt.wrap = true
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.guicursor = 'n-v-c-i:block-Cursor'
vim.opt.cursorline = true
vim.opt.colorcolumn = '120'
vim.g.mapleader = ';'
vim.opt.mouse = ''
vim.opt.termguicolors = true
vim.g.editorconfig = false


require('lualine').setup({
    options = {
        theme = 'one_monokai',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
})
require("one_monokai").setup({
    transparent = true,  -- enable transparent window
    colors = {
        lmao = "#ffffff", -- add new color
        pink = "#ec6075", -- replace default color
    },
    themes = function(colors)
        -- change highlight of some groups,
        -- the key and value will be passed respectively to "nvim_set_hl"
        return {
            Normal = { bg = colors.lmao },
            DiffChange = { fg = colors.white:darken(0.3) },
            ErrorMsg = { fg = colors.pink, standout = true },
            ["@lsp.type.keyword"] = { link = "@keyword" }
        }
    end,
    italics = false, -- disable italics
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',
        'checkmake',
        'clangd',
        'cmake',
        'dockerls',
        'doctoc',
        'lemminx',
        'ltex',
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
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>'] = cmp.mapping.confirm({select = true}),

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


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)


require('whitespace-nvim').setup({
    -- configuration options and their defaults

    -- `highlight` configures which highlight is used to display
    -- trailing whitespace
    highlight = 'DiffDelete',

    -- `ignored_filetypes` configures which filetypes to ignore when
    -- displaying trailing whitespace
    ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },

    -- `ignore_terminal` configures whether to ignore terminal buffers
    ignore_terminal = true,
})

-- remove trailing whitespace with a keybinding
vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)


require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cmake", "zig" },
  sync_install = false,
  auto_install = true
}

