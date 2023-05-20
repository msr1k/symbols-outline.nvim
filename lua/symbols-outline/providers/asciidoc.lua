local adoc_parser = require 'symbols-outline.asciidoc'

local M = {}

-- probably change this
function M.should_use_provider(bufnr)
  return string.match(vim.api.nvim_buf_get_option(bufnr, 'ft'), 'asciidoc')
end

function M.hover_info(_, _, on_info)
  on_info(nil, {
    contents = {
      kind = 'asciidoc',
      contents = { 'No extra information availaible!' },
    },
  })
end

---@param on_symbols function
function M.request_symbols(on_symbols)
  on_symbols(adoc_parser.handle_asciidoc())
end

return M
