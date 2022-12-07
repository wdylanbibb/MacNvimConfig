-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/wdylanbibb/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/wdylanbibb/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/wdylanbibb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/wdylanbibb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/wdylanbibb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { " require('plugins/comment') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { " require('plugins/lsp/luasnip') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-session"] = {
    config = { " require('plugins/auto-session') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["better-escape.nvim"] = {
    config = { " require('plugins/better-escape') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { " require('plugins/ui/bufferline') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["clangd_extensions.nvim"] = {
    config = { " require('plugins/lsp/language/clangd') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-ctags"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-ctags",
    url = "https://github.com/delphinus/cmp-ctags"
  },
  ["cmp-dap"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-dap",
    url = "https://github.com/rcarriga/cmp-dap"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["cosmic-ui"] = {
    config = { " require('plugins/ui/cosmic-ui') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/cosmic-ui",
    url = "https://github.com/CosmicNvim/cosmic-ui"
  },
  ["crates.nvim"] = {
    config = { " require('plugins/lsp/language/crates') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["diffview.nvim"] = {
    config = { " require('plugins/diffview')" },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  dracula = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/dracula",
    url = "https://www.github.com/dracula/vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { " require('plugins/ui/gitsigns') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim/"
  },
  ["indent-blankline.nvim"] = {
    config = { " require('plugins/ui/indent-blankline') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kat.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/kat.nvim",
    url = "https://github.com/katawful/kat.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { " require('plugins/lsp/lspsaga') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { " require('plugins/ui/lualine') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://www.github.com/nvim-lualine/lualine.nvim"
  },
  ["mini.pairs"] = {
    config = { " require('plugins/pairs') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/mini.pairs",
    url = "https://github.com/echasnovski/mini.pairs"
  },
  ["mini.starter"] = {
    config = { " require('plugins/ui/starter') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/mini.starter",
    url = "https://github.com/echasnovski/mini.starter"
  },
  ["mini.surround"] = {
    config = { " require('plugins/surround') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/mini.surround",
    url = "https://github.com/echasnovski/mini.surround"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["noice.nvim"] = {
    config = { " require('plugins/ui/noice') " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://www.github.com/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { " require('plugins/lsp/cmp') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    config = { " require('plugins/ui/cursorline') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-dap"] = {
    config = { " require('plugins/lsp/dap/dap') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { " require('plugins/lsp/dap/dapui') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { " require('plugins/lsp/dap/dap-virtual-text') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    config = { " require('plugins/lsp/lspconfig') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { " require('plugins/ui/nvim-tree') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { " require('plugins/lsp/treesitter') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://www.github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://www.github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { " require('plugins/lsp/language/rust') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { " require('plugins/lsp/symbols-outline') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    config = { " require('plugins/lsp/telescope') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { " require('plugins/toggleterm') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { " require('plugins/ui/colorschemes/tokyonight')" },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { " require('plugins/lsp/trouble') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { " require('plugins/ui/twilight') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-cargo"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/vim-cargo",
    url = "https://github.com/timonv/vim-cargo"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/vim-cmake",
    url = "https://github.com/cdelledonne/vim-cmake"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  vimpeccable = {
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/vimpeccable",
    url = "https://github.com/svermeulen/vimpeccable"
  },
  ["which-key.nvim"] = {
    config = { " require('plugins/which-key') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { " require('plugins/ui/zen-mode') " },
    loaded = true,
    path = "/Users/wdylanbibb/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
 require('plugins/lsp/lspconfig') 
time([[Config for nvim-lspconfig]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
 require('plugins/lsp/lspsaga') 
time([[Config for lspsaga.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
 require('plugins/ui/bufferline') 
time([[Config for bufferline.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
 require('plugins/lsp/trouble') 
time([[Config for trouble.nvim]], false)
-- Config for: cosmic-ui
time([[Config for cosmic-ui]], true)
 require('plugins/ui/cosmic-ui') 
time([[Config for cosmic-ui]], false)
-- Config for: clangd_extensions.nvim
time([[Config for clangd_extensions.nvim]], true)
 require('plugins/lsp/language/clangd') 
time([[Config for clangd_extensions.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
 require('plugins/ui/gitsigns') 
time([[Config for gitsigns.nvim]], false)
-- Config for: mini.pairs
time([[Config for mini.pairs]], true)
 require('plugins/pairs') 
time([[Config for mini.pairs]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
 require('plugins/ui/indent-blankline') 
time([[Config for indent-blankline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
 require('plugins/ui/lualine') 
time([[Config for lualine.nvim]], false)
-- Config for: mini.surround
time([[Config for mini.surround]], true)
 require('plugins/surround') 
time([[Config for mini.surround]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
 require('plugins/lsp/dap/dapui') 
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
 require('plugins/ui/cursorline') 
time([[Config for nvim-cursorline]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
 require('plugins/lsp/dap/dap-virtual-text') 
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
 require('plugins/comment') 
time([[Config for Comment.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
 require('plugins/lsp/symbols-outline') 
time([[Config for symbols-outline.nvim]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
 require('plugins/better-escape') 
time([[Config for better-escape.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
 require('plugins/ui/colorschemes/tokyonight')
time([[Config for tokyonight.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
 require('plugins/ui/twilight') 
time([[Config for twilight.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
 require('plugins/lsp/luasnip') 
time([[Config for LuaSnip]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
 require('plugins/ui/zen-mode') 
time([[Config for zen-mode.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
 require('plugins/toggleterm') 
time([[Config for toggleterm.nvim]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
 require('plugins/lsp/language/crates') 
time([[Config for crates.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
 require('plugins/auto-session') 
time([[Config for auto-session]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
 require('plugins/diffview')
time([[Config for diffview.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
 require('plugins/lsp/cmp') 
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
 require('plugins/which-key') 
time([[Config for which-key.nvim]], false)
-- Config for: mini.starter
time([[Config for mini.starter]], true)
 require('plugins/ui/starter') 
time([[Config for mini.starter]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
 require('plugins/lsp/language/rust') 
time([[Config for rust-tools.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
 require('plugins/lsp/telescope') 
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
 require('plugins/lsp/treesitter') 
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
 require('plugins/lsp/dap/dap') 
time([[Config for nvim-dap]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
 require('plugins/ui/nvim-tree') 
time([[Config for nvim-tree.lua]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'noice.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
