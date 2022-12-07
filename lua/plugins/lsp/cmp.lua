-- Set up nvim-cmp.
local vim = vim
local cmp = require('cmp')

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require('luasnip')
local lspkind = require('lspkind')

require("luasnip.loaders.from_vscode").lazy_load({ paths = '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' })

function leave_snippet()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
        require('luasnip').unlink_current()
    end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		documentation = {
			border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
		},
		completion = {
			border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
			winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
		}
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 's', 'i' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 's', 'i' }),
		['<C-Space>'] = cmp.mapping.complete({}),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = 'luasnip' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'ctags' },
		{ name = 'nvim_lua' },
		{ name = 'crates' },
		{ name = 'path' },
		{ name = 'buffer' },
	},
	enabled = function()
		-- return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require('cmp_dap').is_dap_buffer()
		-- disable completion in comments
		local context = require 'cmp.config.context'
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == 'c' then
			return true
		else
			return not context.in_treesitter_capture("comment")
				and not context.in_syntax_group("Comment")
		end
	end,
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50,
				menu = ({
					buffer = '[Buf]',
					nvim_lsp = '[LSP]',
					luasnip = '[Snip]',
					nvim_lua = '[Lua]',
					cmdline = '[CMD]',
					ctags = '[Tag]',
					nvim_lsp_signature_help = '[Sig]',
					path = '[Path]',
					crates = '[Crates]',
				})
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			local menu_len = 10 - string.len(strings[2])
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    (" .. strings[2] .. ")" .. string.rep(' ', menu_len) .. (kind.menu or '[nil]')

			return kind
		end,
	},
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' },
		{ name = 'buffer' },
	})
})

cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
	sources = {
		{ name = 'dap' }
	}
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline({ '/' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'nvim_lsp_document_symbol' },
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	})
})
