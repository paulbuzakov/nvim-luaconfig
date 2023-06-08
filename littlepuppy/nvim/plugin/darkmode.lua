local status, plugin = pcall(require, 'dark_notify')

if (not status) then
    return
end

plugin.run()
