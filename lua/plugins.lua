-- Plugins using Packer.nvim
-- Full git addresses are used to follow hyperlink
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup {
	function(use)
		use 'https://www.github.com/wbthomason/packer.nvim'

		---------------------- UI Plugins ----------------------
		-- Colorschemes
		use {'https://www.github.com/dracula/vim', as = 'dracula'}
		use 'https://www.github.com/shaunsingh/nord.nvim'
		use 'https://github.com/katawful/kat.nvim'
		use { 'https://github.com/folke/tokyonight.nvim',
			config = [[ require('plugins/ui/colorschemes/tokyonight')]]
		}

		-- Status Line
		use { 'https://www.github.com/nvim-lualine/lualine.nvim',
			requires = { 'https://www.github.com/kyazdani42/nvim-web-devicons', opt = true },
			config = [[ require('plugins/ui/lualine') ]],
		}

		-- File Explorer
		use { 'https://github.com/nvim-tree/nvim-tree.lua',
			requires = { 'nvim-tree/nvim-web-devicons' },
			config = [[ require('plugins/ui/nvim-tree') ]],
		}

		-- Bufferline
		use { 'https://github.com/akinsho/bufferline.nvim', tag = 'v3.*',
			requires = 'kyazdani42/nvim-web-devicons',
			config = [[ require('plugins/ui/bufferline') ]]
		}

		-- -- Fancy notifications
		use 'https://github.com/rcarriga/nvim-notify'

		-- Messages Overhaul
		use { 'https://github.com/folke/noice.nvim',
			event = 'VimEnter',
			requires = {
				'https://github.com/MunifTanjim/nui.nvim',
				'https://github.com/rcarriga/nvim-notify',
			},
			config = [[ require('plugins/ui/noice') ]],
		}

		-- UI wrapper for some vim functionality
		use { 'https://github.com/CosmicNvim/cosmic-ui',
			requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
			config = [[ require('plugins/ui/cosmic-ui') ]],
		}

		-- Display indents
		use { 'https://github.com/lukas-reineke/indent-blankline.nvim',
			config = [[ require('plugins/ui/indent-blankline') ]]
		}

		-- Shows lsp diagnostics on virtual lines
		-- use { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
		-- 	config = function()
		-- 		require('lsp_lines').setup()
		-- 	end
		-- }

		-- Highlights current line cursor is on after certain amount of time
		use { 'https://github.com/yamatsum/nvim-cursorline',
			config = [[ require('plugins/ui/cursorline') ]],
		}

		-- Git information in gutter
		use { 'https://github.com/lewis6991/gitsigns.nvim/',
			config = [[ require('plugins/ui/gitsigns') ]]
		}

		-- Dim inactive code portions
		use { 'https://github.com/folke/twilight.nvim',
			config = [[ require('plugins/ui/twilight') ]]
		}

		-- Distraction free programming
		use { 'https://github.com/folke/zen-mode.nvim',
			config = [[ require('plugins/ui/zen-mode') ]]
		}

		-- Start screen
		use { 'https://github.com/echasnovski/mini.starter',
			config = [[ require('plugins/ui/starter') ]]
		}

		-- Colorizer
		use { 'https://github.com/norcalli/nvim-colorizer.lua',
			config = function() require('colorizer').setup() end
		}


		---------------------- Useful QOL Plugins ----------------------
		-- Ends certain structures automatically
		use { 'https://github.com/echasnovski/mini.pairs',
			config = [[ require('plugins/pairs') ]]
		}

		-- Adds extra text structures
		use 'https://github.com/wellle/targets.vim'

		-- Add/change/delete surrounding delimiter pairs
		use { 'https://github.com/echasnovski/mini.surround',
			config = [[ require('plugins/surround') ]]
		}

		-- Commenting
		use 'https://github.com/tpope/vim-commentary'

		-- Extra commenting functionality
		use { 'https://github.com/numToStr/Comment.nvim',
			config = [[ require('plugins/comment') ]]
		}

		-- Smooth scroll
		use 'https://github.com/psliwka/vim-smoothie'

		-- Escape insert mode using 'jk' or 'jj'
		use { 'https://github.com/max397574/better-escape.nvim',
			config = [[ require('plugins/better-escape') ]]
		}

		-- Map keys to lua functions
		use 'https://github.com/svermeulen/vimpeccable'

		-- Floating terminal emulator (<C-\><C-n> to exit insert mode)
		use { 'https://github.com/akinsho/toggleterm.nvim', tag = '*',
			config = [[ require('plugins/toggleterm') ]]
		}

		-- Git integration
		use 'https://github.com/tpope/vim-fugitive'

		-- Lazygit
		use 'https://github.com/kdheepak/lazygit.nvim'

		-- Git diff view
		use { 'https://github.com/sindrets/diffview.nvim',
			config = [[ require('plugins/diffview')]]
		}

		-- Mapping help
		use { 'https://github.com/folke/which-key.nvim',
			config = [[ require('plugins/which-key') ]]
		}

		use { 'https://github.com/rmagatti/auto-session',
			config = [[ require('plugins/auto-session') ]]
		}


		---------------------- Language Plugins ----------------------
		-- Enhanced language parsing
		use { 'https://github.com/nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			config = [[ require('plugins/lsp/treesitter') ]]
		}

		-- Treesitter plugin for finding highlighting under cursor
		use 'https://github.com/nvim-treesitter/playground'

		-- Find, Filter, Preview, Pick
		use { 'https://github.com/nvim-telescope/telescope.nvim', tag = '0.1.0',
			requires = { {'nvim-lua/plenary.nvim'} },
			config = [[ require('plugins/lsp/telescope') ]]
		}

		-- LSP
		-- Icons for lsp completion items
		use 'https://github.com/onsails/lspkind.nvim'

		-- Configs for the Nvim LSP Client
		use { 'https://github.com/neovim/nvim-lspconfig',
			config = [[ require('plugins/lsp/lspconfig') ]]
		}

		-- Various LSP utilities with nice UI
		use { 'https://github.com/glepnir/lspsaga.nvim', branch = 'main',
			config = [[ require('plugins/lsp/lspsaga') ]]
		}

		-- Diagnostics list
		use { 'https://github.com/folke/trouble.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = [[ require('plugins/lsp/trouble') ]]
		}

		-- Debugger (see link for installing Adapters)
		use { 'https://github.com/mfussenegger/nvim-dap',
			config = [[ require('plugins/lsp/dap/dap') ]],
		}
		-- UI for controlling debugger
		use { 'https://github.com/rcarriga/nvim-dap-ui',
			requires = {'mfussenegger/nvim-dap'},
			config = [[ require('plugins/lsp/dap/dapui') ]]
		}
		-- Virtual text for debugging information
		use { 'https://github.com/theHamsta/nvim-dap-virtual-text',
			requires = { 'mfussenegger/nvim-dap' },
			config = [[ require('plugins/lsp/dap/dap-virtual-text') ]]
		}
		-- Telescope extension for dap
		use 'https://github.com/nvim-telescope/telescope-dap.nvim'

		use { 'https://github.com/simrat39/symbols-outline.nvim',
			config = [[ require('plugins/lsp/symbols-outline') ]]
		}

		-- VSCode Snippets
		use 'https://github.com/rafamadriz/friendly-snippets'

		-- Snippet engine
		use { 'https://github.com/L3MON4D3/LuaSnip', run = 'make install_jsregexp',
			config = [[ require('plugins/lsp/luasnip') ]]
		}

		-- LuaSnip plugin for CMP
		use 'https://github.com/saadparwaiz1/cmp_luasnip'
		-- LSP completion
		use 'https://github.com/hrsh7th/cmp-nvim-lsp'
		-- Display function signatures
		use 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help'
		-- Create word list from buffer content
		use 'https://github.com/hrsh7th/cmp-buffer'
		-- Path completion
		use 'https://github.com/hrsh7th/cmp-path'
		-- Command completion
		use 'https://github.com/hrsh7th/cmp-cmdline'
		-- Debugging completion
		use 'https://github.com/rcarriga/cmp-dap'
		-- Lua API completion
		use 'https://github.com/hrsh7th/cmp-nvim-lua'
		-- CTags completion
		use 'https://github.com/delphinus/cmp-ctags'
		-- Document Symbol completion
		use 'https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol'
		-- Code completion
		use { 'https://github.com/hrsh7th/nvim-cmp',
			config = [[ require('plugins/lsp/cmp') ]]
		}


		---------------------- Language Specific Plugins ----------------------
		-- Lua (setup called in lspconfig)
		use 'https://github.com/folke/neodev.nvim'

		-- C / C++ / CMake
		use 'https://github.com/cdelledonne/vim-cmake'
		use { 'https://github.com/p00f/clangd_extensions.nvim',
			config = [[ require('plugins/lsp/language/clangd') ]]
		}

		-- Rust / Cargo
		use { 'https://github.com/simrat39/rust-tools.nvim',
			config = [[ require('plugins/lsp/language/rust') ]]
		}
		use { 'https://github.com/saecki/crates.nvim', tag = 'v0.3.0',
			requires = { 'nvim-lua/plenary.nvim' },
			config = [[ require('plugins/lsp/language/crates') ]]
		}
		use 'https://github.com/timonv/vim-cargo'
	end
}

