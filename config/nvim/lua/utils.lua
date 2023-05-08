local M = {}

function M.installed_via_bundler(gemname)
  local gemfile = vim.fn.getcwd() .. "/Gemfile.lock"

  if vim.fn.filereadable(gemfile) == 0 then
    return false
  end

  for line in io.lines(gemfile) do
    if string.find(line, gemname) then
      return true
    end
  end

  return false
end

return M
