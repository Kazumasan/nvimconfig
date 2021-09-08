require'lspinstall'.setup() -- important

--local capabilites = vim.lsp.protocol.make_client_capabilities()
--capabilites = require('cmp_nvim_lsp').update_capabilities(capabilites)

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
    --capabilities = capabilities
  }
end
