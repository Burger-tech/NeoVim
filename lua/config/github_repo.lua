local git_root = vim.fn.expand("~/.config/nvim/code/git")

vim.api.nvim_create_user_command("OpenGitHubRepo", function(opts)
  local repo = opts.args
  if repo == "" then
    print("Usage: :OpenGitHubRepo user/repo")
    return
  end

  local path = git_root .. "/" .. repo
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
    local cmd = "gh repo clone " .. repo .. " " .. path
    print("Cloning " .. repo .. " into " .. path .. " ...")
    vim.fn.system(cmd)
  else
    print("Opening existing repo: " .. path)
  end

  vim.cmd("cd " .. path)
  vim.cmd("e .") -- open file explorer in repo root
end, {
  nargs = 1,
  complete = nil,
  desc = "Clone and open a GitHub repo in ~/.config/nvim/code/git/",
})
