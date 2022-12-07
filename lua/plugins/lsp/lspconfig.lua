-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local vim = vim
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


local settings = require('plugins.lsp.utils').settings

require('neodev').setup {
	library = {
		enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
		-- these settings will be used for your Neovim config directory
		runtime = true, -- runtime path
		types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
		plugins = true, -- installed opt or start plugins in packpath
		-- you can also specify the list of plugins to make available as a workspace library
		-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
	},
	setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
	-- for your Neovim config directory, the config.library settings will be used as is
	-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
	-- for any other directory, config.library.enabled will be set to false
	override = function(root_dir, options) end,
	-- With lspconfig, Neodev will automatically setup your lua-language-server
	-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
	-- in your lsp start options
	lspconfig = true,
}

-- Lua Setup
require('lspconfig').sumneko_lua.setup {
	on_attach = settings.on_attach,
	flags = settings.flags,
	cmd = { 'lua-language-server' },
	handlers = settings.handlers,
	capabilities = settings.capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace"
			}
		}
	}
}

-- Cmake Setup
require('lspconfig').cmake.setup(settings)

-- Python
require('lspconfig').pylsp.setup(settings)

require('lspconfig').wgsl_analyzer.setup {
	on_attach = settings.on_attach,
	flags = settings.flags,
	handlers = settings.handlers,
	capabilities = settings.capabilities,
}

