local Remap = require("burcz.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<Leader>ft", function()
    require('FTerm').open()
end)

