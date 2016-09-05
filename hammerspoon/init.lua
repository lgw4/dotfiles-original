-- Modifier keys
local mv_mod = {"control", "option"}
local mv_mod_shift = {"control", "option", "shift"}
local rz_mod = {"control", "command"}
local rz_mod_shift = {"control", "command", "shift"}
local act_mod = {"control", "option", "command"}
local act_mod_shift = {"control", "option", "command", "shift"}
local no_mod = {}

-- Disable animation
hs.window.animationDuration = 0

-- Get list of screens and refresh that list whenever screens are plugged or unplugged:
local screens = hs.screen.allScreens()
local screenwatcher = hs.screen.watcher.new(function()
  screens = hs.screen.allScreens()
end)
screenwatcher:start()

-- Move frontmost window a number of pixels in x and y
function move_window(xpos, ypos)
  local win = hs.window.frontmostWindow()
  local f = win:frame()

  f.x = f.x + xpos
  f.y = f.y + ypos
  win:setFrameInScreenBounds(f)
end

-- Resize frontmost by moving the bottom
function resize_window(xpixels, ypixels)
  local win = hs.window.frontmostWindow()
  local f = win:frame()

  f.w = f.w + xpixels
  f.h = f.h + ypixels
  win:setFrameInScreenBounds(f)
end

-- Center frontmost window
function center_window()
  local win = hs.window.frontmostWindow()

  win:centerOnScreen(ensureInScreenBounds)
end

-- Move to monitor x. Checks to make sure monitor exists, if not moves to last monitor that exists
function moveToMonitor(x)
  local win = hs.window.frontmostWindow()
  local newScreen = nil

  while not newScreen do
    newScreen = screens[x]
    x = x - 1
  end
  win:moveToScreen(newScreen)
end

-- Movement hotkeys
-- Move directonally by 1 pixel
hs.hotkey.bind(mv_mod, "UP", function() move_window(0, -1) end)
hs.hotkey.bind(mv_mod, "DOWN", function() move_window(0, 1) end)
hs.hotkey.bind(mv_mod, "LEFT", function() move_window(-1, 0) end)
hs.hotkey.bind(mv_mod, "RIGHT", function() move_window(1, 0) end)

-- Move directionally by 10 pixels
hs.hotkey.bind(mv_mod_shift, "UP", function() move_window(0, -10) end)
hs.hotkey.bind(mv_mod_shift, "DOWN", function() move_window(0, 10) end)
hs.hotkey.bind(mv_mod_shift, "LEFT", function() move_window(-10, 0) end)
hs.hotkey.bind(mv_mod_shift, "RIGHT", function() move_window(10, 0) end)

-- Resize hotkeys
-- Resize directionally by 1 pixel
hs.hotkey.bind(rz_mod, "UP", function() resize_window(0, -1) end)
hs.hotkey.bind(rz_mod, "DOWN", function() resize_window(0, 1) end)
hs.hotkey.bind(rz_mod, "LEFT", function() resize_window(-1, 0) end)
hs.hotkey.bind(rz_mod, "RIGHT", function() resize_window(1, 0) end)

-- Resize directionally by 10 pixels
hs.hotkey.bind(rz_mod_shift, "UP", function() resize_window(0, -10) end)
hs.hotkey.bind(rz_mod_shift, "DOWN", function() resize_window(0, 10) end)
hs.hotkey.bind(rz_mod_shift, "LEFT", function() resize_window(-10, 0) end)
hs.hotkey.bind(rz_mod_shift, "RIGHT", function() resize_window(10, 0) end)

-- Center frontmost window
hs.hotkey.bind(act_mod, "=", function() center_window() end)

-- Manually reload configuration
-- Found in the "Getting Started with Hammerspoon" guide (http://www.hammerspoon.org/go/)
hs.hotkey.bind(act_mod_shift, "R", function()
  hs.reload()
end)

-- Automatically reload configuration on save
-- Found in the "Getting Started with Hammerspoon" guide (http://www.hammerspoon.org/go/)
function reloadConfig(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Hammerspoon configuration loaded.")
