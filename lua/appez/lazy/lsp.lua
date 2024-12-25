return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "angularls",
                "bashls",
                "html",
                "ts_ls",
                "pyright"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,
            }
        })
        vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
}
