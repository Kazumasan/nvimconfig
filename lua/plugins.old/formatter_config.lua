require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            '--single-quote',
            '--tab-width 2'
          },
          stdin = true
        }
      end
    },
  }
})
