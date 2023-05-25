local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup({
        window = {
          width = 35
        },
        filesystem = {
          hijack_netrw_behavior = "disabled"
        }
      })
    end
  },

  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({})
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end
  },

  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup()
    end
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  },

  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },

  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  },

  {
    'brenoprata10/nvim-highlight-colors',
    config = function() require('nvim-highlight-colors').setup {} end
  },
})
