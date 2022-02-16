local lsp_install = require("nvim-lsp-installer")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_install.on_server_ready(function(server)
  opts = {
    capabilities = capabilities
  }
  server:setup(opts)
end)
