local utils = require("utils")

local function lsp_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, bufnr)
    end,
  })
end

local function lsp_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

local M = {}

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = { callSnippet = "Replace" },
        telemetry = { enable = false },
        hint = {
          enable = false,
        },
      },
    },
  },
  tsserver = {
    disable_formatting = true,
  },
  eslint = {
    settings = {
      validate = "on",
    },
  },
}

local other_servers = {}

if utils.installed_via_bundler("solargraph") then
  servers.solargraph = {
    cmd = { "bundle", "exec", "solargraph", "stdio" },
    init_options = { formatting = false },
    settings = {
      solargraph = {
        diagnostics = true,
        logLevel = "debug",
      },
    },
    -- capabilities = lsp_capabilities,
    -- on_attach = lsp_attach,
  }
end

if utils.installed_via_bundler("syntax_tree") then
  other_servers.syntax_tree = {
    cmd = { "bundle", "exec", "stree", "lsp" },
    -- capabilities = lsp_capabilities,
    -- on_attach = lsp_attach,
  }
end

function M.setup(_)
  lsp_attach(function(client, buffer)
    require("plugins.lsp.format").on_attach(client, buffer)
    require("plugins.lsp.keymaps").on_attach(client, buffer)
  end)

  require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
  require("mason-lspconfig").setup_handlers({
    function(server)
      local opts = servers[server] or {}
      opts.capabilities = lsp_capabilities()
      require("lspconfig")[server].setup(opts)
    end,
  })
  for server, opts in pairs(other_servers) do
    opts.capabilities = lsp_capabilities()
    require("lspconfig")[server].setup(opts)
  end
end

return M
