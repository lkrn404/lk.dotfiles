return {
   filetypes = {
      filename = {
         ["compose.yml"] = "yaml.docker-compose",
         ["compose.yaml"] = "yaml.docker-compose",
      },
      pattern = {
         -- vim.filetype.add() implicitly anchors patterns with ^...$
         [".*docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
      },
   },
   servers = {
      -- Overrides here merge onto nvim-lspconfig defaults via vim.lsp.config()
      docker_language_server = {},
      docker_compose_language_service = {},
   },
}
