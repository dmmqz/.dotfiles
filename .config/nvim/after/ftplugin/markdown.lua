vim.cmd [[ setlocal makeprg=tldr-lint\ % ]]

-- Keybind for tldr-pages to get changes from English file since the last time a translation page was updated
vim.keymap.set("n", "<leader>gtl", function()
  local abs_path = vim.api.nvim_buf_get_name(0)
  if abs_path == "" then
    vim.notify("No file name for current buffer", vim.log.levels.WARN)
    return
  end

  local left_root = abs_path:match("pages%.%w-/")
  local right_root = "pages/"

  local tail = abs_path:match(".*/" .. left_root .. "(.*)$")
            or abs_path:match(".*/" .. right_root .. "(.*)$")
  if not tail or tail == "" then
    vim.notify("File is not under /" .. left_root .. " or /" .. right_root .. ":\n" .. abs_path, vim.log.levels.WARN)
    return
  end

  local left  = left_root  .. tail
  local right = right_root .. tail

  local file_dir = vim.fs.dirname(abs_path)
  local cmd = { "git", "rev-parse", "--show-toplevel" }

  local repo_root
  if vim.system then
    local r = vim.system(cmd, { cwd = file_dir, text = true }):wait()
    if r.code ~= 0 or not r.stdout or r.stdout == "" then
      vim.notify("Not a git repo (from " .. file_dir .. ")", vim.log.levels.ERROR)
      return
    end
    repo_root = (r.stdout:gsub("%s+$", ""))
  else
    local out = vim.fn.systemlist("cd " .. vim.fn.shellescape(file_dir) .. " && git rev-parse --show-toplevel")
    if vim.v.shell_error ~= 0 or not out[1] or out[1] == "" then
      vim.notify("Not a git repo (from " .. file_dir .. ")", vim.log.levels.ERROR)
      return
    end
    repo_root = out[1]
  end

  local hash
  if vim.system then
    local r = vim.system({ "git", "log", "-1", "--format=%H", "--", left }, { cwd = repo_root, text = true }):wait()
    hash = r.stdout and r.stdout:match("([0-9a-fA-F]+)")
    if r.code ~= 0 or not hash then
      vim.notify("Couldn't find last commit for: " .. left, vim.log.levels.ERROR)
      return
    end
  else
    local out = vim.fn.systemlist("cd " .. vim.fn.shellescape(repo_root) .. " && git log -1 --format=%H -- " .. vim.fn.shellescape(left))
    if vim.v.shell_error ~= 0 or not out[1] or out[1] == "" then
      vim.notify("Couldn't find last commit for: " .. left, vim.log.levels.ERROR)
      return
    end
    hash = out[1]
  end

  local old_cwd = vim.fn.getcwd()
  vim.cmd("cd " .. vim.fn.fnameescape(repo_root))
  local ok, err = pcall(vim.cmd, "Git diff " .. hash .. "..HEAD -- " .. vim.fn.fnameescape(right))
  vim.cmd("cd " .. vim.fn.fnameescape(old_cwd))
  if not ok then
    vim.notify(tostring(err), vim.log.levels.ERROR)
  end
end, { desc = "Show changes to English TLDR file since last time a translation page was update" })
