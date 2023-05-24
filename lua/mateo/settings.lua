vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "80"

vim.opt.updatetime = 50

vim.opt.laststatus = 3
vim.opt.showtabline = 0
vim.opt.cmdheight = 2
vim.opt.pumheight = 10

vim.opt.compatible = false

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.lazyredraw = true

vim.opt.iskeyword:append "-"
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.showmode = false
vim.opt.fillchars = "eob: "

vim.opt.shell = "pwsh.exe -NoLogo"

function SpellToggle()
  if vim.opt.spell:get() then
    vim.opt_local.spell = false
    vim.opt_local.spelllang = "en"
  else
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us", "de" }
  end
end

-- statusline
local git_branch = function()
  if vim.g.gitsigns then
    local branch = "%{get(b:,'gitsigns_head','')}"
    if branch ~= '' then return string.upper(" " .. branch) end
  end
  return ''
end

local file_path = function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  if buf_name == "" then return "[No Name]" end
  local home = vim.env.HOME
  local is_term = false
  local file_dir = ""

  if buf_name:sub(1, 5):find("term") ~= nil then
    file_dir = vim.env.PWD
    is_term = true
  else
    file_dir = vim.fn.expand("%:p:h")
  end

  if file_dir:find(home, 0, true) ~= nil then
    file_dir = file_dir:gsub(home, "~", 1)
  end

  if vim.api.nvim_win_get_width(0) <= 80 then
    file_dir = vim.fn.pathshorten(file_dir)
  end
  if is_term then
    return file_dir
  else
    return string.format("%s/%s", file_dir, vim.fn.expand("%:t"))
  end
end

local modes = setmetatable({
  ['n'] = { ' NORMAL', ' N' },
  ['no'] = { ' N·OPERATOR', ' N·P' },
  ['v'] = { ' VISUAL', ' V' },
  ['V'] = { ' V·LINE', ' V·L' },
  [''] = { ' V·BLOCK', ' V·B' },
  [''] = { ' V·BLOCK', ' V·B' },
  ['s'] = { ' SELECT', ' S' },
  ['S'] = { ' S·LINE', ' S·L' },
  [''] = { ' S·BLOCK', ' S·B' },
  ['i'] = { ' INSERT', ' I' },
  ['ic'] = { ' INSERT', ' I' },
  ['R'] = { ' REPLACE', ' R' },
  ['Rv'] = { ' V·REPLACE', ' V·R' },
  ['c'] = { ' COMMAND', ' C' },
  ['cv'] = { ' VIM·EX', ' V·E' },
  ['ce'] = { ' EX', ' E' },
  ['r'] = { ' PROMPT', ' P' },
  ['rm'] = { ' MORE', ' M' },
  ['r?'] = { ' CONFIRM', ' C' },
  ['!'] = { ' SHELL', ' S' },
  ['t'] = { ' TERMINAL', ' T' }
}, {
  __index = function()
    return { 'UNKNOWN', 'U' } -- handle edge cases
  end
})

local get_current_mode = function()
  local current_mode = vim.api.nvim_get_mode().mode
  if vim.api.nvim_win_get_width(0) <= 80 then
    return string.format('%s ', modes[current_mode][2])
  else
    return string.format('%s ', modes[current_mode][1])
  end
end

---@diagnostic disable-next-line: lowercase-global
function status_line()
  return table.concat {
    get_current_mode(),                      -- get current mode
    "%{get(b:,'gitsigns_head','')}",         -- branch name
    " %<",                                   -- spacing
    file_path(),                             -- smart full path filename
    "%h%m%r%w",                              -- help flag, modified, readonly, and preview
    "%=",                                    -- right align
    "%{get(b:,'gitsigns_status','')}",       -- gitsigns
    " [%-3.(%l|%c] ",                        -- line number, column number
    require('lsp-progress').progress(),
    " [%{strlen(&ft)?&ft[0].&ft[1:]:'None'}]" -- file type
  }
end

-- vim.opt.statusline = "%!v:lua.status_line()"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- refresh lualine
vim.cmd([[
augroup lualine_augroup
    autocmd!
    autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
augroup END
]])
