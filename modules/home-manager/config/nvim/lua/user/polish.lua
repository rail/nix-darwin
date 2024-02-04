
remember_last_position = function()
  vim.api.nvim_create_autocmd(
    { "BufReadPost" },
    {
      callback = function()
        local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
        if {row, col} ~= {0, 0} then
				  vim.api.nvim_win_set_cursor(0, {row, col})
			  end
      end,
    }
  )
end


return function()
  remember_last_position()
end
