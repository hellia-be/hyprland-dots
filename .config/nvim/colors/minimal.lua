local M = {
  color0 = "#1c1c1c",
  color1 = "#5f5f5f",
  color2 = "#808080",
  color3 = "#9e9e9e",
  color4 = "#a6a6a6",
  color5 = "#7c7c7c",
  color6 = "#e4e4e4",
  color7 = "#f5f5f5",
  color8 = "#262626",
  color9 = "#6c6c6c",
  color10 = "#949494",
  color11 = "#b2b2b2",
  color12 = "#c6c6c6",
  foreground = "#d9d9d9",
  color14 = "#cccccc",
  color15 = "#ffffff",
  black = "#000000",
  ui_gray_dark = "#404040",
  ui_gray_med = "#595959",
  ui_gray_light = "#a6a6a6",
  ui_pmenu_bg = "#333333",
  ui_pmenu_sel = "#707070",
  ui_status_nc_fg = "#808080",
}

-- Clear existing highlights and reset syntax
vim.cmd("highlight clear")
vim.cmd("syntax reset")

-- Set background to dark, foreground to light gray
vim.cmd("set background=dark")

--Basic UI elements
vim.cmd("highlight Normal guibg=" .. M.black .. " guifg=" .. M.foreground)
vim.cmd("highlight NonText guibg=" .. M.black .. " guifg=" .. M.black)
vim.cmd("highlight CursorLine guibg=" .. M.ui_gray_med)
vim.cmd("highlight LineNr guifg=" .. M.foreground)
vim.cmd("highlight CursorLineNr guifg=" .. M.ui_gray_med)
vim.cmd("highlight SignColumn guibg=" .. M.black)
vim.cmd("highlight StatusLine guibg=" .. M.color8 .. " guifg=" .. M.foreground .. " gui=bold")
vim.cmd("highlight StatusLineNC guibg=" .. M.black .. " guifg=" .. M.ui_status_nc_fg)
vim.cmd("highlight Directory guifg=" .. M.color15)
vim.cmd("highlight Visual guibg=" .. M.ui_gray_dark)
vim.cmd("highlight Search guibg=" .. M.ui_gray_med .. "guifg=" .. M.ui_gray_light)
vim.cmd("highlight CurSearch guibg=" .. M.ui_gray_light .. " guifg=" .. M.black)
vim.cmd("highlight IncSearch gui=None guibg=" .. M.ui_gray_light .. " guifg=" .. M.black)
vim.cmd("highlight MatchParen guibg=" .. M.ui_gray_med .. " guifg=" .. M.ui_gray_light)
vim.cmd("highlight Pmenu guibg=" .. M.ui_pmenu_bg .. " guifg=" .. M.color15)
vim.cmd("highlight PmenuSel guibg=" .. M.ui_pmenu_sel .. " guifg=" .. M.color15)
vim.cmd("highlight PmenuSbar guibg=" .. M.ui_pmenu_sel)
vim.cmd("highlight VertSplit guifg=" .. M.black)
vim.cmd("highlight MoreMsg guifg=" .. M.color15)
vim.cmd("highlight Question guifg=" .. M.color15)
vim.cmd("highlight Title guifg=" .. M.color15)

-- Syntax highlighting
vim.cmd("highlight Comment guifg=" .. M.color5 .. " gui=italic")
vim.cmd("highlight Constant guifg=" .. M.color6)
vim.cmd("highlight Identifier guifg=" .. M.foreground)
vim.cmd("highlight Statement guifg=" .. M.color12)
vim.cmd("highlight PreProc guifg=" .. M.color14)
vim.cmd("highlight Type guifg=" .. M.color15 .. " gui=bold")
vim.cmd("highlight Special guifg=" .. M.color14)

-- Refined syntax highlighting
vim.cmd("highlight String guifg=" .. M.color12)
vim.cmd("highlight Number guifg=" .. M.color12)
vim.cmd("highlight Boolean guifg=" .. M.color12)
vim.cmd("highlight Function guifg=" .. M.foreground)
vim.cmd("highlight Keyword guifg=" .. M.color15 .. " gui=bold")

-- HTML syntax highlighting
vim.cmd("highlight Tag guifg=" .. M.color12)
vim.cmd("highlight @tag.delimiter guifg=" .. M.color4)
vim.cmd("highlight @tag.attribute guifg=" .. M.color3)

-- Messages & Diagnostics
vim.cmd("highlight ErrorMsg guifg=" .. M.color1 .. " gui=bold")
vim.cmd("highlight Error guifg=" .. M.color1 .. " gui=bold")
vim.cmd("highlight DiagnosticError guifg=" .. M.color1)
vim.cmd("highlight DiagnosticVirtualTextError guibg=" .. M.color8 .. " guifg=" .. M.color1)

vim.cmd("highlight WarningMsg guifg=" .. M.color2)
vim.cmd("highlight DiagnosticWarn guifg=" .. M.color2)
vim.cmd("highlight DiagnosticVirtualTextWarn guibg=" .. M.color8 .. " guifg=" .. M.color2)

vim.cmd("highlight DiagnosticInfo guifg=" .. M.color3)
vim.cmd("highlight DiagnosticVirtualTextInfo guibg=" .. M.color8 .. " guifg=" .. M.color3)

vim.cmd("highlight DiagnosticOk guifg=" .. M.color5)
