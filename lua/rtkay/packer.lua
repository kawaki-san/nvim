local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
    use 'wbthomason/packer.nvim'
    use 'sainnhe/everforest'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'
    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-lint'

    use { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            "kylechui/nvim-surround",
        }
    }

    use { 'L3MON4D3/LuaSnip',
        requires = {
            'saadparwaiz1/cmp_luasnip'
        }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        "debugloop/telescope-undo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'simrat39/rust-tools.nvim'
    use "rafamadriz/friendly-snippets"


    if packer_bootstrap then
        require('packer').sync()
    end
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    } })
