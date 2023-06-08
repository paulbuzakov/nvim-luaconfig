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

    use { 'nvim-lua/plenary.nvim' }
    use { 'cormacrelf/dark-notify' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'rcarriga/nvim-notify' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }   
    use { 'junegunn/fzf', run = './install --bin' }
    use { 'ibhagwan/fzf-lua' }
    use { 
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    use({
        "glepnir/lspsaga.nvim",
        opt = true,
        branch = "main",
        event = "LspAttach"
    })
    use { 'jose-elias-alvarez/null-ls.nvim' } 
    use { 'folke/which-key.nvim' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    if packer_bootstrap then
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
