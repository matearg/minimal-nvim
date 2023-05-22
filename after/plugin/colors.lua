function ColorMyPencils(color)
  vim.opt.background = 'dark'

  require('tokyonight').setup({
    transparent = true
  })

  require('onedarkpro').setup({
    options = {
      transparency = true
    }
  })

  color = color or "onedark"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
