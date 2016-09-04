-- Modifier keys
local action = {"control", "command"}
local shift_action = {"shift", "control", "command"}
local move = {"control", "option"}
local shift_move = {"shift", "control", "option"}
local resize = {"control", "option", "command"}
local shift_resize = {"shift", "control", "option", "command"}

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
hs.hotkey.bind(move, "UP", function() move_window(0, -1) end)
hs.hotkey.bind(move, "DOWN", function() move_window(0, 1) end)
hs.hotkey.bind(move, "LEFT", function() move_window(-1, 0) end)
hs.hotkey.bind(move, "RIGHT", function() move_window(1, 0) end)

-- Move directionally by 10 pixels
hs.hotkey.bind(shift_move, "UP", function() move_window(0, -10) end)
hs.hotkey.bind(shift_move, "DOWN", function() move_window(0, 10) end)
hs.hotkey.bind(shift_move, "LEFT", function() move_window(-10, 0) end)
hs.hotkey.bind(shift_move, "RIGHT", function() move_window(10, 0) end)

-- Center frontmost window
hs.hotkey.bind(move, "C", function()
  local win = hs.window.frontmostWindow()

  win:centerOnScreen(ensureInScreenBounds)
end)

-- Resize hotkeys
-- Resize directionally by 1 pixel
hs.hotkey.bind(resize, "UP", function() resize_window(0, -1) end)
hs.hotkey.bind(resize, "DOWN", function() resize_window(0, 1) end)
hs.hotkey.bind(resize, "LEFT", function() resize_window(-1, 0) end)
hs.hotkey.bind(resize, "RIGHT", function() resize_window(1, 0) end)

-- Resize directionally by 10 pixels
hs.hotkey.bind(shift_resize, "UP", function() resize_window(0, -10) end)
hs.hotkey.bind(shift_resize, "DOWN", function() resize_window(0, 10) end)
hs.hotkey.bind(shift_resize, "LEFT", function() resize_window(-10, 0) end)
hs.hotkey.bind(shift_resize, "RIGHT", function() resize_window(10, 0) end)

-- Manually reload configuration
-- Found in the "Getting Started with Hammerspoon" guide (http://www.hammerspoon.org/go/)
hs.hotkey.bind(shift_action, "R", function()
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
