-- vim.opt.termguicolors = true

vim.cmd.syntax("on")
--vim.opt.number = true
vim.opt.relativenumber = true

-- size of a hard tabstop
vim.opt.tabstop = 4

-- always uses spaces instead of tab characters
vim.opt.expandtab = true

-- size of an indentation
vim.opt.shiftwidth = 4

-- double h key press in quick succession exits insert mode
vim.keymap.set('i', 'hh', '<esc>')

-- statusline
vim.opt.laststatus = 2
vim.cmd.hi("Statusline cterm=NONE ctermfg=NONE ctermbg=Black")
vim.cmd.hi("StatuslineNC cterm=NONE ctermfg=247 ctermbg=NONE")
vim.cmd.hi("VertSplit cterm=NONE ctermfg=Black ctermbg=NONE")

vim.cmd.hi("StatuslineGit cterm=Bold ctermfg=Black ctermbg=Magenta")
vim.cmd.hi("StatuslineFile cterm=Bold ctermfg=Black ctermbg=Yellow")
vim.cmd.hi("StatuslineFileType cterm=Bold ctermfg=Green ctermbg=Black")
vim.cmd.hi("StatuslineModified cterm=Bold ctermfg=Magenta ctermbg=Black")
vim.cmd.hi("StatuslineDivider1 cterm=Bold ctermfg=Magenta ctermbg=Yellow")
vim.cmd.hi("StatuslineDivider2 cterm=Bold ctermfg=Yellow ctermbg=Black")
vim.cmd.hi("StatuslineRight1 cterm=Bold ctermfg=Black ctermbg=Blue")
vim.cmd.hi("StatuslineRight2 cterm=Bold ctermfg=Black ctermbg=Green")
vim.cmd.hi("StatuslineRight3 cterm=Bold ctermfg=Black ctermbg=Red")
vim.cmd.hi("StatuslineDividerRight1 cterm=Bold ctermfg=Blue ctermbg=Green")
vim.cmd.hi("StatuslineDividerRight2 cterm=Bold ctermfg=Green ctermbg=Red")
vim.cmd.hi("StatuslineDividerRight3 cterm=Bold ctermfg=Red ctermbg=Black")
vim.cmd.hi("StatuslineRight cterm=Bold ctermfg=Black ctermbg=Blue")

local function current_branch(path)
    local git_branch = vim.fn.system("git -C " .. path .. " branch --show-current 2> /dev/null | tr -d '\n'")
    if git_branch ~= "" then
        local git_status = vim.fn.system("git -C " .. path .. " status -s")
        if git_status ~= "" then
            return ' ' .. git_branch .. "*" .. ' '
        else
            return ' ' .. git_branch .. ' '
        end
    else
        return ""
    end
end

--vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained" }, {
--    callback = function()
--        vim.b.current_branch = current_branch()
--    end
--})

local mygroup = vim.api.nvim_create_augroup('statusline', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    pattern = '*',
    group = 'statusline',
    callback = function()
        local path = vim.fn.expand('%:h')
        vim.b.current_branch = current_branch(path)
        statusline = ''
        statusline = statusline .. '%#StatuslineGit# ' .. vim.b.current_branch .. '%#StatuslineDivider1#'
        statusline = statusline .. '%#StatuslineFile#' .. ' %F %#StatuslineDivider2#'
        statusline = statusline .. '%#StatuslineFileType#' .. ' %y '
        statusline = statusline .. '%#StatuslineModified#' .. ' %m '
        statusline = statusline .. '%#StatuslineDivider#' .. '%='
        statusline = statusline .. ' %#StatuslineDividerRight3#%#StatuslineRight3# %{&ff} ' .. '%#StatuslineDividerRight2#%#StatuslineRight2# %l/%L ' .. '%#StatuslineDividerRight1#%#StatuslineRight1# (%p%%) ' .. '%#StatuslineRight 0%v '
        vim.opt_local.statusline = statusline
    end
})
vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    pattern = '*',
    group = 'statusline',
    callback = function()
        local path = vim.fn.expand('%:h')
        vim.b.current_branch = current_branch(path)
        statusline = ' ' .. vim.b.current_branch
        statusline = statusline .. ' %F '
        statusline = statusline .. ' %y '
        statusline = statusline .. ' %m '
        statusline = statusline .. '%='
        statusline = statusline .. ' %{&ff} ' .. ' %l/%L ' .. ' (%p%%) ' .. ' 0%v '
        vim.opt_local.statusline = statusline
    end
})

