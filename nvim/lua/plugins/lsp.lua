return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'saghen/blink.cmp',
    opts = {
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          }
        }
      },
      keymap = {
        ["<CR>"] = { 'select_and_accept' },
      }
    },
  },
  config = function()
    local capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
        }
      }
    }
    vim.lsp.config("*", {
      capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
    })
    vim.lsp.enable({
      "gopls",
      "jdtls",
      "kotlin_language_server",
      "lua_ls",
      "pylsp",
      "rust_analyzer",
      "ts_ls",
    })
  end,
}
