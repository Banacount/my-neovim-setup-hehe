return {
    -- Mason
    {
        "mason-org/mason.nvim",
        opts = {}
    },

    -- LSP Config
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}
