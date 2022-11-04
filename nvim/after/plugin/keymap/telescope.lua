local Remap = require("burcz.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<Leader>tf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<Leader>tk", function()
    require('burcz.telescope').search_xund_k8s()
end)
