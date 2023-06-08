local status, plugin = pcall(require, 'nvim-treesitter.configs')
if (not status) then
    return
end

plugin.setup {
    ensure_installed = {
        "c_sharp", 
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "fish",
        "json",
        "yaml",
        "css",
        "html"
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = true,
    }
}
