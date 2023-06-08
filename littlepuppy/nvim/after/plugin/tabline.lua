local status, plugin = pcall(require, 'bufferline')
if (not status) then
    return
end

vim.opt.termguicolors = true

plugin.setup({
    options = {
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
        always_show_bufferline = true,
    }
})
