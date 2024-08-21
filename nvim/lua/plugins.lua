-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use 'nightsense/snow'
  use 'ellisonleao/gruvbox.nvim'
  use "joshdick/onedark.vim"
  use 'nordtheme/vim'
  use 'cpea2506/one_monokai.nvim'

  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!

  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
    "folke/todo-comments.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      -- {'williamboman/mason.nvim'},
      -- {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-ui-select.nvim' }

  -- Using packer.nvim
  use 'johnfrankmorgan/whitespace.nvim'

  use 'xiyaowong/transparent.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }

  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}

  use 'jiangmiao/auto-pairs'

  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  --use 'romgrk/barbar.nvim'
  use 'tpope/vim-fugitive'

  use 'christoomey/vim-tmux-navigator'

  use 'airblade/vim-gitgutter'
end)
