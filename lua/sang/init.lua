local get_mapper = function(mode, noremap)
  return function(lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = noremap
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local noremap = get_mapper('n', false)
local nnoremap = get_mapper('n', true)
local inoremap = get_mapper('i', true)
local vnoremap = get_mapper('v', true)

inoremap('jk', '<Esc>', { desc = 'Esc' })
noremap('0', '^', { desc = 'Beginning of line' })
noremap('q', '<Nop>', { desc = "Don't use macro" })

-- Don't move with arrow key

nnoremap('<Left>', ':echoe "Use h"<CR>', { desc = 'Use h' })
nnoremap('<Right>', ':echoe "Use l"<CR>', { desc = 'Use l' })
nnoremap('<Up>', ':echoe "Use k"<CR>', { desc = 'Use k' })
nnoremap('<Down>', ':echoe "Use j"<CR>', { desc = 'Use j' })

-- Shift+H goto head of the line, Shift+L goto end of the line
nnoremap('H', '^', { desc = 'Go to beginning line' })
nnoremap('L', '$', { desc = 'Go to end line' })

-- Useful saving mapping
nnoremap('<leader>w', ':w!<cr>', { desc = 'Force save' })
nnoremap('<C-S>', ':update<CR>', { desc = 'Force save' })
vnoremap('<C-S>', '<C-C>:update<CR>', { desc = 'Force save' })
inoremap('<C-S>', '<C-C>:update<CR>', { desc = 'Force save' })

vim.api.nvim_create_user_command('W', 'execute w !sudo tee % > /dev/null) <bar> edit!', {
  bang = true,
})

-- Switch CWD to the directory of the open buffer
noremap('<Leader>cd', ':cd %:p:h<cr>:pwd<cr>', { desc = 'Change working directory' })

-- Copy to clipboard
vnoremap('<C-C>', '"+y', { desc = 'Copy to clipboard' })
vnoremap('<Leader>y', '"+y', { desc = 'Copy to clipboard' })
nnoremap('<Leader>y', '"+y', { desc = 'Copy to clipboard' })
nnoremap('<Leader>p', '"+p', { desc = 'Paste' })

-- Yank to end
nnoremap('Y', 'y$', { desc = 'Yank to end' })

-- Move a line of text using ALT+[jk]
nnoremap('<M-j>', 'mz:m+<cr>`z')
nnoremap('<M-k>', 'mz:m-2<cr>`z')
vnoremap('<M-j>', ":m'>+<cr>`<my`>mzgv`yo`z")
vnoremap('<M-k>', ":m'<-2<cr>`>my`<mzgv`yo`z")

-- Turn off search highlight
noremap('<Leader><cr>', ':noh<cr>', { desc = 'Clear highlight' })

-- Split windows
noremap('<leader>sv', '<C-W>v', { desc = 'Split vertical' })
noremap('<Leader>ss', '<C-W>s', { desc = 'Split horizontal' })

-- Resize panel
nnoremap('<C-w>[', ':vertical resize -6<CR>')
nnoremap('<C-w>]', ':vertical resize +6<CR>')

-- center search results after / or ?
noremap('n', 'nzz')
noremap('N', 'Nzz')

-- stay in indent mode after indenting
vnoremap('<', '<gv')
vnoremap('>', '>gv')
