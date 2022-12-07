local vim = vim
local map = require('utils').map

vim.g.mapleader = ' '

-- insert mode
map('i', '<C-BS>', '<C-S-w>')
map('i', '<C-Z>', '<C-[>zza')

-- wrap
map('n', '<Leader>w', '<cmd>w<CR>')
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- highlighting
map('n', '<C-L>', '<cmd>nohl<CR><C-L>')

-- navigation
--- behave like other capitals
map('n', 'Y', 'y$')
--- moving text
map("v", "J", "<cmd>m '>+1<CR>gv=gv")
map("v", "K", "<cmd>m '<-2<CR>gv=gv")
map("n", "<leader>k", "<cmd>m .-2<CR>==")
map("n", "<leader>j", "<cmd>m .+1<CR>==")

