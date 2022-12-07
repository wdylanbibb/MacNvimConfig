-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

local custom_tokyonight = require('lualine.themes.tokyonight')

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = custom_tokyonight,
		component_separators = '│',
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '' }, right_padding = 2 },
		},
		lualine_b = { 'filename', 'branch' },
		lualine_c = { require('auto-session-library').current_session_name },
		lualine_x = {},
		lualine_y = { 'filetype', 'progress' },
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = {
			{ 'filename', separator = { left = '', right = '' }, right_padding = 2 },
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{ 'location', separator = { left = '', right = '' }, left_padding = 2 },
		},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { 'nvim-tree', 'toggleterm', 'nvim-dap-ui' }
}
