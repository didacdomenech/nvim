local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  -- commit = "18267654c665310c665d3b7c6bc43d5f5ea5e410",
}

-- Check the operating system
local function getOS()
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Darwin" then
    return "macOS"
  elseif os_name == "Windows_NT" then
    return "Windows"
  elseif os_name == "Linux" then
    if vim.fn.has("wsl") == 1 then
      return "WSL"
    else
      return "Linux"
    end
  end
end

-- Detect dark mode on macOS
local function detectDarkModeMac()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  
  if result:match("Dark") then
    return "Dark"
  else
    return "Light"
  end
end

-- Detect dark mode on Windows
local function detectDarkModeWindows()
  local handle = io.popen([[powershell -Command "(Get-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize).AppsUseLightTheme"]])
  local result = handle:read("*a")
  handle:close()
  
  if result:match("0") then
    return "Dark"
  else
    return "Light"
  end
end

-- Detect dark mode on Linux (GNOME/GTK-based)
local function detectDarkModeLinux()
  local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
  local result = handle:read("*a")
  handle:close()

  if result:match("dark") then
    return "Dark"
  else
    return "Light"
  end
end

-- Main function to detect dark mode based on OS
local function detectDarkMode()
  local os = getOS()
  
  if os == "macOS" then
    return detectDarkModeMac()
  elseif os == "Windows" then
    return detectDarkModeWindows()
  elseif os == "Linux" then
    return detectDarkModeLinux()
  elseif os == "WSL" then
    return "Dark" -- default for WSL, or you can customize this
  end
end

-- Configure the theme based on detected mode
function M.config()
  local theme = detectDarkMode()
  if theme == "Dark" then
    vim.cmd.colorscheme "catppuccin-mocha"
  elseif theme == "Light" then
    vim.cmd.colorscheme "catppuccin-latte"
  else
    vim.cmd.colorscheme "catppuccin-mocha" -- fallback to dark
  end
end

return M
