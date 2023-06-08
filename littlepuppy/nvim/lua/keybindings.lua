vim.g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<Esc>', ':nohlsearch<CR>')

-- Select all text of file
map('n', '<leader>a', 'ggVG')

-- Switching between windows
map('n', '<leader>w', '<C-w>w')
