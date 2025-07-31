if nil == vim.pack then
    return
end

vim.pack.add({
    -- colorscheme
    -- { src = 'https://github.com/vague2k/vague.nvim' },
    -- { src = 'https://github.com/nightsense/snow'},
    -- { src = 'https://github.com/EdenEast/nightfox.nvim'},
    { src = 'https://github.com/cpea2506/one_monokai.nvim'},
    { src = 'https://github.com/olimorris/onedarkpro.nvim'},

    -- useful
    { src = 'https://github.com/johnfrankmorgan/whitespace.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/airblade/vim-gitgutter' },
    { src = 'https://github.com/akinsho/git-conflict.nvim' },
    { src = 'https://github.com/windwp/nvim-autopairs' },
    { src = 'http://github.com/folke/todo-comments.nvim' },

    -- lsp and search
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },

    { src = 'https://github.com/dstein64/vim-startuptime' },
})

