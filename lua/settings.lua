local vim = vim -- reduce LSP errors
local exec = vim.api.nvim_exec -- execute Vimscript
local opt = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

opt.wrap = false -- Don't automatically wrap on load
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.autoindent = true -- maintain indent
opt.tabstop = 4 -- Spaces per tab
opt.shiftwidth = 4 -- Spaces per shift (<< or >>)
opt.smarttab = true
opt.splitright = true -- Vertical Split splits to the right of the current buffer
opt.splitbelow = true -- Horizontal Split splits below the current buffer

opt.laststatus = 2 -- Show status line even if there is one buffer
opt.confirm = true -- Raise a dialogue asking if you wish to save changed files
opt.cmdheight = 2 -- Set command window height to 2 lines

opt.termguicolors = true -- Use full gui colors 

local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight-day')
if not ok then
	vim.cmd 'colorscheme default' -- if all else fails, use default
end

-- vim.diagnostic.config({virtual_text = false})

opt.signcolumn = 'yes'

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- highlight on yank
exec([[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500, on_visual=true}
	augroup end
]], false)

cmd([[
	au BufReadPost,FileReadPost * normal zR
]])


