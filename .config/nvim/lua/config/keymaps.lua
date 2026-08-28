-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Copy relative file path to the system clipboard
vim.keymap.set("n", "<leader>cp", function()
  -- The ":." modifier ensures it is relative to the CWD/project root
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, { desc = "Copy relative path" })
