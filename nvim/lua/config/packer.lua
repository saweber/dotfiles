-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Dark theme
  use({
    'sainnhe/sonokai',
    as = 'sonokai',
    config = function()
      vim.cmd('let g:sonokai_style = "shusia"')
      vim.cmd('colorscheme sonokai')
    end
  })

  -- Light theme
  use({
    'cocopon/iceberg.vim',
    as = 'iceberg'
  })

  -- Status line
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Syntax Highlighting
  use({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
  use('nvim-treesitter/playground')

  -- File Navigation
  --use('ThePrimeagen/harpoon')
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  -- Snippet Collection (Optional)
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- use {
  --   'junegunn/fzf.vim',
  --   requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  -- }

end)
