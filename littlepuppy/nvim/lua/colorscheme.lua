local status, plugin = pcall(require, 'catppuccin')
if (not status) then
    return
end

local darkStatus, darkPlugin = pcall(require, 'dark_notify')
if (not darkStatus) then
    return
end


if vim.o.background == 'dark' then
    vim.cmd("colorscheme catppuccin-mocha")
else
    vim.cmd("colorscheme catppuccin-latte")
end

vim.api.nvim_create_autocmd({"OptionSet"}, {
    pattern = {"background"},
    callback = function(ev)
        if vim.o.background == 'dark' then
            vim.cmd("colorscheme catppuccin-mocha")
        else
            vim.cmd("colorscheme catppuccin-latte")
        end
        vim.cmd("mode")
    end
})
