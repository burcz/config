local ts = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = {
    ts.setup{
      defaults = {
        mappings = {
          n = {
            ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        }
      }

    }
  },
  keys = {
    {
      "<leader>pf",
      builtin.find_files,
      {}
    },
    {
      "<leader>ps",
      function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end,
      {}
    },
    {
      "<leader>pp",
      builtin.grep_string,
      {}
    },
    {
      "<leader>vh",
      builtin.help_tags,
      {}
    },
  }
}



