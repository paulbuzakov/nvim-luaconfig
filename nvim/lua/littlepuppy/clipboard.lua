local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac == 1 then
    vim.opt.clipboard:append { 'unnamedplus' }
end

if is_win == 1 then
    vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end

if is_wsl == 1 then
    vim.cmd [[
        augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
        augroup END
    ]]
end
