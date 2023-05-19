-- vim.opt.termguicolors = true
-- vim.cmd.colorscheme("jellybeans")

vim.cmd.syntax("on")
vim.opt.number = true
vim.opt.relativenumber = true

-- size of a hard tabstop
vim.opt.tabstop = 4

-- always uses spaces instead of tab characters
vim.opt.expandtab = true

-- size of an indentation
vim.opt.shiftwidth = 4

-- double h key press in quick succession exits insert mode
vim.keymap.set('i', 'hh', '<esc>')

local mygroup = vim.api.nvim_create_augroup('BgHighlight', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
  pattern = '*',
  group = BgHighlight,
  command = 'set number',
})
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
  pattern = '*',
  group = 'BgHighlight',  -- equivalent to group=mygroup
  command = 'set relativenumber',
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
    pattern = '*',
    group = 'BgHighlight',
    command = 'set nonumber',
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
    pattern = '*',
    group = 'BgHighlight',
    command = 'set norelativenumber',
})



-- status bar
local black = '#1F2229'
local red = '#D41919'
local green = '#5EBDAB'
local yellow = '#FEA44C'
local blue = '#367BF0'
local magenta = '#BF2E5D'
local cyan = '#49AEE6'
local white = '#E6E6E6'

vim.opt.laststatus = 2
statusline = ''
statusline = statusline .. '%#DiffChange#' .. ' %F '
statusline = statusline .. '%#DiffAdd#' .. ' %y '
statusline = statusline..'%#Conditional#'..' %m '
statusline = statusline .. '%='
statusline = statusline .. '%#Function#' .. ' %{&ff} ' .. ' %l/%L ' .. ' (%p%%) ' .. ' 0%v '
vim.opt.statusline = statusline
