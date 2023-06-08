local status, plugin = pcall(require, 'catppuccin')
if (not status) then
    return
end

plugin.setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        which_key = true
    }
})
