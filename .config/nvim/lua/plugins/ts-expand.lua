return {
  {
    "nemanjamalesija/ts-expand-hover.nvim",
    ft = { "typescript", "typescriptreact" },
    opts = {
      keymaps = {
        hover = "<leader>th", -- Sets 'K' as the trigger for the custom hover window
        expand = "+", -- Press '+' inside the float to expand types recursively
        collapse = "-", -- Press '-' inside the float to collapse them back down
        close = { "q", "<Esc>" },
      },
    },
  },
}
