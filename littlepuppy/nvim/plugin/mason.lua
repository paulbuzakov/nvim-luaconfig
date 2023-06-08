local mStatus, mPlugin = pcall(require, 'mason')
if (not mStatus) then
    return
end

mPlugin.setup()


local mlspStatus, mlspPlugin = pcall(require, 'mason-lspconfig')
if (not mlspStatus) then
    return
end


mPlugin.setup()
mlspPlugin.setup({
    ensure_installed = { "omnisharp", "tsserver", "cssls", "tailwindcss" }
})


local lspStatus, lspPlugin = pcall(require, 'lspconfig')
if (not lspStatus) then
    return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspPlugin.omnisharp.setup { capabilities = capabilities }
lspPlugin.tsserver.setup { capabilities = capabilities }
lspPlugin.cssls.setup { capabilities = capabilities }
lspPlugin.tailwindcss.setup { capabilities = capabilities }
