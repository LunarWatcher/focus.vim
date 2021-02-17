-- vim.cmd is an alias for vim.api.nvim_command (if using nvim)
-- Not entirely sure how to do this aside a fallback. There's no NPE
-- until cmd is invoked, so this should be fine
local cmd = vim.cmd or vim.command  

local autocmd = {}

local function polyfill_flatten(array)
  local result = {}

  for i = 1, #array do
    local v = array[i]
    if type(v) == "table" then
      for k, v in pairs(polyfill_flatten(v)) do result[k] = v end
    elseif v then
      table.insert(result, v)
    end
  end
  return result
end

local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    cmd('augroup '..group_name)
    cmd('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(polyfill_flatten{'autocmd', def}, ' ')
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

