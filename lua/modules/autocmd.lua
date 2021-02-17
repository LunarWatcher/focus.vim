-- vim.cmd is an alias for vim.api.nvim_command (if using nvim)
-- Not entirely sure how to do this aside a fallback. There's no NPE
-- until cmd is invoked, so this should be fine
local cmd = vim.cmd
if (cmd == nil) then
  local cmd = vim.command  
end
local autocmd = {}

local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    cmd('augroup '..group_name)
    cmd('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      cmd(command)
    end
    cmd('augroup END')
  end
end

function autocmd.setup(width,height)
  local definitions = {
    autocmds = {
      { 'BufEnter', '*', 'lua require \'modules.resizer\'.split_resizer('..width..','..height..')'},
      { 'BufEnter', '*', 'setlocal cursorline'},
      { 'BufEnter', '*', 'setlocal signcolumn=no'},
      { 'BufLeave', '*', 'setlocal nocursorline'},
  };
  }

  nvim_create_augroups(definitions)
end


return autocmd

