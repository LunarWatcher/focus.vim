# Auto-Focussing Splits/Windows for Vim and Neovim

🔋 Batteries Included. No configuration neccessary

👌 Maximises Current Split/Window Automatically When Cursor Moves

⚙️  Set Focus Split/Window Width & Height, Disable

🙌 Compatible with NvimTree, NerdTree, CHADTree & QuickFix (QF default to 10, rest won't resize)

# Demo

![screencast](https://i.ibb.co/0tsKww4/focusop.gif)

## Installation
### [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'beauwilliams/focus.nvim'
```
### [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use 'beauwilliams/focus.nvim'
```

# Configuration

**Disable Focus**

Neovim:
```lua
-- place me somewhere in your init.lua
local focus = require('focus')
focus.enable = false
```
Vim:
```vim
lua require("focus").enable = false
```

**Disable Focus (Per Session)**

NOTE: issue command before making some splits
```vim
:DisableFocus
```

**Set Focus Width**

Neovim:
```lua
-- place me somewhere in your init.lua
local focus = require('focus')
focus.width = 120
```

Vim:
```vim
lua require('focus').width = 120
```


**Set Focus Height**

Neovim:
```lua
-- place me somewhere in your init.lua
local focus = require('focus')
focus.height = 40
```

Vim:

```vim
lua require('focus').height = 40
```

**Note:** from testing in Vim, not setting the height may result in some weirdness when the buffers are resized -- notably that the buffers "flash". This doesn't happen when the height is set, and is probably a consequence of `wincmd`. If you experience issues, I recommend explicitly setting the height.

## Planned Improvements 😼

- [ ] Refactoring
- [ ] Adding Filetypes Support as we go
- [ ] Decide default width as per feedback (I like 120)
- [x] Perhaps some other configs, maybe height?
