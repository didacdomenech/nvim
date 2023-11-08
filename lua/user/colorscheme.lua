local M = {
  "catppuccin/nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  commit = "18267654c665310c665d3b7c6bc43d5f5ea5e410",
}

local function isMacOS()
  local handle = io.popen("uname")
  local result = handle:read("*a")
  handle:close()
  return result:match("Darwin") ~= nil
end

local function isLinux()
  local handle = io.popen("uname")
  local result = handle:read("*a")
  handle:close()
  return result:match("Linux") ~= nil
end

local function isWindows()
  local handle = io.popen("ver")
  local result = handle:read("*a")
  handle:close()
  return result:match("Windows") ~= nil
end

local function detectDarkMode()
  if isMacOS() then
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    local result = handle:read("*a")
    handle:close()

    if result:match("Dark") then
      return "Dark"
    else
      return "Light"
    end
  elseif isLinux() then
    -- This is just an example and may not work for all Linux distributions or desktop environments
    local handle = io.popen("gsettings get org.gnome.desktop.interface gtk-theme")
    local result = handle:read("*a")
    handle:close()

    if result:match("dark") or result:match("Dark") then
      return "Dark"
    else
      return "Light"
    end
  elseif isWindows() then
    -- This PowerShell command needs to be adjusted to properly detect dark mode in Windows
    local handle = io.popen([[powershell -command "Get-AppxPackage -Name Microsoft.Windows.StartMenuExperienceHost"]])
    local result = handle:read("*a")
    handle:close()

    if result:match("Dark") then
      return "Dark"
    else
      return "Light"
    end
  else
    return "Unknown"
  end
end

local theme = detectDarkMode()
print("The current theme mode is:", theme)


function M.config()
    if theme:match("Dark") then
      vim.cmd.colorscheme "catppuccin-mocha"
    else
      vim.cmd.colorscheme "catppuccin-latte"
    end
end

return M
