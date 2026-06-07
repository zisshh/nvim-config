local treesitter = require("nvim-treesitter")

treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

local treesitter_augroup = vim.api.nvim_create_augroup("UserTreeSitterConfig", { clear = true })
local filetypes = { "c", "lua", "rust", "ruby", "vim", "html" }

vim.api.nvim_create_autocmd("FileType", {
  group = treesitter_augroup,
  pattern = filetypes,
  callback = function(event)
    local bufnr = event.buf
    local ok = pcall(vim.treesitter.start, bufnr)

    if ok then
      vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
