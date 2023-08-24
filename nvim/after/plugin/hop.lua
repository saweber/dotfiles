local hop = require('hop')

vim.keymap.set('', '<leader>fs', function()
  hop.hint_char2({ current_line_only = false, hint_offset = 1 })
end, {remap=true})

