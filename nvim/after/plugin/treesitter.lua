local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then
    return
end

ts.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    ensure_installed = {
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "json",
        "yaml",
        "css",
        "html",
        "lua"
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
