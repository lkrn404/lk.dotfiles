return {
   filetypes = {
      pattern = {
         -- vim.filetype.add() implicitly anchors patterns with ^...$, and
         -- including '/' matches against the full path rather than only basename
         [".*/.*ansible.*%.ya?ml"] = "yaml.ansible",
      },
   },
   servers = {
      -- Overrides here merge onto nvim-lspconfig defaults via vim.lsp.config()
      ansiblels = {},
   },
}
