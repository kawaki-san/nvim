local on_attach, capabilities = require('rtkay.lsp')
local lsp = require('lspconfig').rust_analyzer

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            parameter_hints_prefix = "« ",
            other_hints_prefix = "» ",
        },
    },
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importPrefix = "by_self",
                },
                inlayHints = { locationLinks = false },
                cargo = {
                    loadOutDirsFromCheck = true,
                    allFeatures = true
                },
                procMacro = {
                    enable = true
                },
                checkOnSave = {
                    command = "clippy"
                },
                diagnostics = {
                    enable = true,
                    disabled = { "unresolved-proc-macro" },
                    enableExperimental = true,
                },
            }
        }
    },
}
require('rust-tools').setup(opts)

lsp.manager.try_add_wrapper()
