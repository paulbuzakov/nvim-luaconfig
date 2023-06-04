local packer_bootstrap = false
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local conf = {
    profile = {
        enable = true,
        threshold = 0,
    },
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }
}

local function init()
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path
        }
        vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

local function plugins(use)
    use { "wbthomason/packer.nvim" }

    use { "nvim-lua/plenary.nvim", module = "plenary" }
    --    use {
    --        "sainnhe/everforest",
    --        config = function()
    --            vim.cmd 'colorscheme everforest'
    --        end
    --    }
    use {
        'EdenEast/nightfox.nvim',
        config = function()
            vim.cmd 'colorscheme nightfox'
        end
    }

    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
    use { "bronson/vim-trailing-whitespace" }
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { { 'nvim-lua/plenary.nvim' } } }
    use { 'nvim-tree/nvim-tree.lua', requires = { { 'nvim-tree/nvim-web-devicons' } } }
    use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" }
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use { 'rcarriga/nvim-notify' }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('littlepuppy.treesitter')
        end,
        requires = { { 'paulbuzakov/nvim-ts-autotag' } }
    }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'windwp/nvim-autopairs' }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'dinhhuy258/git.nvim' }

    if packer_bootstrap then
        print "Restart Neovim required after installation!"
        require("packer").sync()
    end
end

init()

local status, packer = pcall(require, 'packer')
if (not status) then
    return
end

packer.init(conf)
packer.startup(plugins)
