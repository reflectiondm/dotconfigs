local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "bluz71/vim-nightfly-guicolors" -- colorscheme

  use "christoomey/vim-tmux-navigator" -- tmux & split window integration

  use "szw/vim-maximizer"

  use "tpope/vim-surround"
  use "vim-scripts/ReplaceWithRegister"

  -- commenting with gc
  use "numToStr/Comment.nvim"

  -- file explorer
  use "nvim-tree/nvim-tree.lua"

  use "kyazdani42/nvim-web-devicons"

  use "nvim-lualine/lualine.nvim"

  -- fuzzy finding
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope.nvim", branch = "0.1.4" }


  -- autocompletion
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/nvim-cmp"
  use "onsails/lspkind-nvim"
  use "L3MON4D3/LuaSnip"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
  
  use "neovim/nvim-lspconfig"
  use "nvim-treesitter/nvim-treesitter"
  use 'voldikss/vim-floaterm'


  if packer_bootstrap then
    require("packer").sync()
  end
end)
