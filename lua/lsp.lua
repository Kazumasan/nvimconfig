require('lspinstall').setup() -- important

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = require('lspinstall').installed_servers()
for _, server in pairs(servers) do
  require('lspconfig')[server].setup{
    capabilities = capabilities
  }
end
  

