local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.luacheck.with({
      condition = function(utils)
        return utils.root_has_file({ ".luacheckrc" })
      end,
    }),
  },
  on_attach = function(client, bufnr)
    local map_opts = { noremap = true, silent = true }

    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<Leader>f",
      "<cmd>lua require('config.lsp.formatting').format()<CR>",
      map_opts
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "x",
      "<Leader>f",
      "<cmd>lua require('config.lsp.formatting').range_format()<CR>",
      map_opts
    )
  end,
})

local eslint = require("eslint")
eslint.setup({
  bin = "eslint_d",
})

local prettier = require("prettier")
prettier.setup({
  bin = "prettier",
})
