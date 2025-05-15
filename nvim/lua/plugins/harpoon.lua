local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

return {
  "ThePrimeagen/harpoon",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<C-e>",
      function()
        ui:toggle_quick_menu()
      end,
    },
    {
      "<leader>a",
      function()
        mark.add_file()
      end,
    },
    {
      "<C-t>",
      function()
        ui.nav_file(1)
      end,
    },
    {
      "<C-n>",
      function()
        ui.nav_file(2)
      end,
    },
    {
      "<C-h>",
      function()
        ui.nav_file(3)
      end,
    },
    {
      "<C-s>",
      function()
        ui.nav_file(4)
      end,
    },
  }
}


