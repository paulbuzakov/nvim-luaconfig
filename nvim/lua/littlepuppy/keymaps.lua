vim.g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<Esc>', ':nohlsearch<CR>')

-- Disable
map('', '<Up>', '<nop>')
map('', '<Down>', '<nop>')
map('', '<Left>', '<nop>')
map('', '<Right>', '<nop>')

-- Delete full word backwards
map('n', '<Leader>d', 'dvb')


-- Move selected Up or Down
map('v', 'j', ":m '>+1<CR>gv=gv")
map('v', 'k', ":m '<-2<CR>gv=gv")
