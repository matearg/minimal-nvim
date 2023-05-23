function ColorMyPencils(color)
  vim.opt.background = 'dark'

  color = color or "onedark"
  vim.cmd.colorscheme(color)
end

ColorMyPencils()
