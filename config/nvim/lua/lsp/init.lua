-- LSP loader: registers per-language filetypes, vim.lsp.config overrides,
-- mason, and mason-lspconfig ensure_installed from lua/lsp/<lang>.lua modules.
--
-- Each language module returns a table:
-- {
--    filetypes = { ... }, -- optional table passed to vim.filetype.add()
--    servers = {
--       ["<server_name>"] = { ... }, -- vim.lsp.config overrides; `{}` uses nvim-lspconfig defaults
--    },
-- }

local languages = {
   "lua",
   "ansible",
   "clang",
   "powershell",
   "docker",
   "bash",
}

local ensure_installed = {}

for _, lang in ipairs(languages) do
   local spec = require("lsp." .. lang)

   if spec.filetypes then
      vim.filetype.add(spec.filetypes)
   end

   for server, config in vim.spairs(spec.servers or {}) do
      table.insert(ensure_installed, server)
      if next(config) ~= nil then
         vim.lsp.config(server, config)
      end
   end
end

require("mason").setup({
   ui = {
      icons = {
         package_installed = "✓",
         package_pending = "➜",
         package_uninstalled = "✗",
      },
   },
})

require("mason-lspconfig").setup({
   ensure_installed = ensure_installed,
})
