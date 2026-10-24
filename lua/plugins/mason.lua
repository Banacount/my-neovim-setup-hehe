return {
    -- Mason
    {
        "mason-org/mason.nvim",
        opts = {}
    },

    -- LSP Config
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = { 'jdtls', 'luau_lsp' },
            }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    { 'mfussenegger/nvim-jdtls' }
}
