-- ~/.config/nvim/lua/config/github_repo.lua

local git_root = vim.fn.expand("~/.config/nvim/code/git")
local github_user = "Burger-tech"  -- <-- Replace with your GitHub username

-- Create the command :OpenGitHubRepo
vim.api.nvim_create_user_command("OpenGitHubRepo", function(opts)
  local repo = opts.args

  -- Replace "me" with your GitHub username
  repo = repo:gsub("^me", github_user)

  if repo == "" then
    vim.api.nvim_err_writeln("Usage: :OpenGitHubRepo user/repo")
    return
  end

  -- Define the path to clone the repo
  local path = git_root .. "/" .. repo

  -- If the repo does not exist, clone it
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")  -- Make the directory if it doesn't exist
    local cmd = "gh repo clone " .. repo .. " " .. path
    local result = vim.fn.system(cmd)

    -- Check for errors in cloning the repo
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_err_writeln("Error cloning repository: " .. result)
      return
    end

    vim.api.nvim_out_write("Cloned " .. repo .. " into " .. path .. "\n")
  else
    vim.api.nvim_out_write("Opening existing repo: " .. path .. "\n")
  end

  -- Change directory to the repo and open the file explorer
  vim.cmd("cd " .. path)
  vim.cmd("e .")  -- Open the file explorer in the repo root
end, {
  nargs = 1,   -- Accept one argument (repo name)
  complete = nil,
  desc = "Clone and open a GitHub repo in ~/.config/nvim/code/git/",
})
