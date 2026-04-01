local telescope = require("telescope.builtin")

-- Python
vim.lsp.config("pyright", {})
vim.lsp.config("ruff", {})

-- Lua
vim.lsp.config("lua_ls", {})

-- YAML
vim.lsp.config("yamlls", {})

-- Nix
vim.lsp.config("nil_ls", {})

-- Rust
vim.lsp.config("rust_analyzer", {})

-- Markdown (orthographe fr + en)
vim.lsp.config("ltex", {
  filetypes = { "markdown" },
  settings = {
    ltex = {
      language = "fr"
    },
  },
})

-- Active tous les LSPs configurés ci-dessus
vim.lsp.enable({
  "pyright",
  "ruff",
  "lua_ls",
  "yamlls",
  "nil_ls",
  "rust_analyzer",
  "ltex",
})

-- Raccourcis LSP avec Telescope
vim.keymap.set("n", "gd", telescope.lsp_definitions,       { desc = "Go to definition" })
vim.keymap.set("n", "gr", telescope.lsp_references,        { desc = "References" })
vim.keymap.set("n", "gi", telescope.lsp_implementations,   { desc = "Implementations" })
vim.keymap.set("n", "<leader>ds", telescope.lsp_document_symbols,  { desc = "Document symbols" })
vim.keymap.set("n", "<leader>ws", telescope.lsp_workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>fd", telescope.diagnostics,   { desc = "Diagnostics" })

-- Natifs
vim.keymap.set("n", "K",           vim.lsp.buf.hover,       { desc = "Hover doc" })
vim.keymap.set("n", "<leader>rn",  vim.lsp.buf.rename,      { desc = "Rename" })
vim.keymap.set("n", "<leader>ca",  vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "[d",          vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d",          vim.diagnostic.goto_next, { desc = "Next diagnostic" })
