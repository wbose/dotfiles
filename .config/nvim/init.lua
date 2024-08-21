require("config.lazy")

vim.cmd.colorscheme("pywal16")

-- This is the old line number highlight behaviour
--vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
--vim.api.nvim_set_hl(0, "LineNr", { fg = "#b4befe", bold = true })
--vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })
vim.g.dadbod_ui_use_legacy_sql = 0
-- Function to set a random highlight color for LineNr
function SetRandomLineNrColor()
  math.randomseed(os.time())

  local colors = {
    "#b4befe", -- Lavender
    "#eba0ac", -- Maroon
    "#d2fac5", -- Green
    "#f2cdcd", -- Flamingo
    "#cba6f7", -- Mauve
    "#fcc6a7", -- Peach
    "#89b4fa", -- Blue
    "#89dceb", -- Sky
  }

  local index = math.random(#colors)
  vim.api.nvim_set_hl(0, "LineNr", { fg = colors[index], bold = true })
end

-- Ensure the random color is selected each time Neovim starts
vim.cmd("autocmd VimEnter * lua SetRandomLineNrColor()")

-- Setting highlights for lines above and below
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })
