local status, builtin = pcall(require, "telescope.builtin")
if (not status) then
    return
end


vim.keymap.set('n', '<Leader>ff', function()
    builtin.find_files({ no_ignore = false, hidden = true })
end)

vim.keymap.set('n', '<Leader>fg', function()
    builtin.live_grep()
end)

vim.keymap.set('n', '<Leader>fb', function()
    builtin.buffers()
end)

vim.keymap.set('n', '<Leader>fh', function()
    builtin.help_tags()
end)
