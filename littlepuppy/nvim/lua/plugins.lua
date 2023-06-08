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

    use { 'nvim-tree/nvim-web-devicons' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'rcarriga/nvim-notify' }
    use { 'svrana/neosolarized.nvim', requires = { 'tjdevries/colorbuddy.nvim' }}
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'akinsho/bufferline.nvim', tag = "*" }
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1'}

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
