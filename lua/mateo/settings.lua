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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
