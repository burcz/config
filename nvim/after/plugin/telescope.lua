local ts = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

ts.setup{
  defaults = {
    mappings = {
      n = {
        ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    }
  }

}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})


--vim.keymap.set('n', '<leader>pg', builtin.live_grep,{ search_dirs = vim.fn.expand('%:p:h') })
