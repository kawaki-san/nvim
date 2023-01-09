local on_attach, capabilities = require('rtkay.lsp')

local lsp = require('lspconfig').pyright
lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.manager.try_add_wrapper()

-- linting

require('lint').linters_by_ft = {
    python = { 'pycodestyle', 'pylint' }
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
