local status, plugin = pcall(require, 'lspssaga')
if (not status) then
    return
end

plugin.setup {
}
