local vim = vim --> Use locals
-- Necessary to prevent nil indexing
local api = vim.api or vim
local eval = api.nvim_eval or vim.eval
local cmd = vim.cmd or vim.command

local M = {}
function M.split_resizer(width, height) --> Only resize normal buffers, set qf to 10 always
    if eval('g:focus_enabled') == 0 then return end
    local ft = eval("&ft"):lower() -- Drop meta accessors. Loses some variable modification, but it's fine.
    if ft == 'nvimtree' or ft == 'nerdtree'  or ft == 'chadtree' then 
        return 
    end
    if ft == 'qf' then
        cmd("set winwidth=10")
    else
        cmd("set winwidth=" .. width) --> lua print(vim.o.winwidth)
    end
    if height ~= 0 then cmd("set winheight=" .. height) --> Opt in to set height value, otherwise auto-size it
    else cmd('wincmd=') end --> Auto-Maximize windows horizontally when in focus by DEFAULT


end

return M
