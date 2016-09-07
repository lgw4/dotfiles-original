-- Modules
local fnutils = require "hs.fnutils"
local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
local screen = require "hs.screen"
local window = require "hs.window"

-- Modifier keys
local mod = {"control", "command"}
local mod_shift = {"control", "command", "shift"}

-- Get list of screens and refresh that list whenever screens are plugged or unplugged:
local screens = screen.allScreens()
local screenwatcher = screen.watcher.new(function()
  screens = screen.allScreens()
end)
screenwatcher:start()

-- Create grid
grid.GRIDWIDTH = 10
grid.GRIDHEIGHT = 10
grid.MARGINX = 0
grid.MARGINY = 0
grid.ui.textSize = 48

-- Disable animation
window.animationDuration = 0

-- Original position of moved windows
local original_position = {}

-- Reset the original position when window is restored or closed
local function resetWindowPosition(_, _, _, id)
  original_position[id] = nil
end

-- Move window to edge or back
local function moveWindow(direction)
  local win = window.frontmostWindow()
  local res = screen.mainScreen():frame()
  local id = win:id()

  if not original_position[id] then
    -- Move window to edge if no original position is stored in
    -- original_position for this window id
    local f = win:frame()
    original_position[id] = win:frame()

    -- Add watcher so we can reset the original_position if window is closed
    local watcher = win:newWatcher(resetWindowPosition, id)
    watcher:start({hs.uielement.watcher.elementDestroyed})

    if direction == "left" then f.x = (res.w - (res.w * 2)) + 10 end
    if direction == "right" then f.x = (res.w + res.w) - 10 end
    if direction == "down" then f.y = (res.h + res.h) - 10 end
    win:setFrame(f)
  else
    -- Restore window if there is a value for original_position
    win:setFrame(original_position[id])
    -- Reset the original_position value
    resetWindowPosition(_, _, _, id)
  end
end

hotkey.bind(mod, "A", function() moveWindow("left") end)
hotkey.bind(mod, "D", function() moveWindow("right") end)
hotkey.bind(mod, "S", function() moveWindow("down") end)

-- Center frontmost window
function centerWindow()
  local win = window.frontmostWindow()

  win:centerOnScreen(ensureInScreenBounds)
end

-- Move frontmost window down 100 pixels
function down100Pixels()
  local win = hs.window.frontmostWindow()
  local f = win:frame()

  f.y = 100
  win:setFrameInScreenBounds(f)
end

-- Set size of frontmost window to w x h
function setWindowSize(w, h)
  local win = window.frontmostWindow()
  local size = hs.geometry.size(w, h)

  win:setSize(size)
end

-- Center frontmost window
hotkey.bind(mod, "=", function() centerWindow() end)

-- Center frontmost window macOS-style
hotkey.bind(mod_shift, "=", function()
  centerWindow()
  down100Pixels()
end)

-- Set dimensions of frontmost window
hotkey.bind(mod, "1", function() setWindowSize(1024, 768) end)
hotkey.bind(mod, "2", function() setWindowSize(1280, 720) end)
hotkey.bind(mod, "3", function() setWindowSize(1366, 768) end)
hotkey.bind(mod, "5", function() setWindowSize(1152, 864) end)
hotkey.bind(mod, "6", function() setWindowSize(640, 480) end)
hotkey.bind(mod, "8", function() setWindowSize(800, 600) end)
hotkey.bind(mod, "F", function() setWindowSize(705, 505) end)

-- Move windows
hotkey.bind(mod, "DOWN", grid.pushWindowDown)
hotkey.bind(mod, "UP", grid.pushWindowUp)
hotkey.bind(mod, "LEFT", grid.pushWindowLeft)
hotkey.bind(mod, "RIGHT", grid.pushWindowRight)

-- Move windows across screens
hotkey.bind(mod, "N", grid.pushWindowNextScreen)
hotkey.bind(mod, "P", grid.pushWindowPrevScreen)

-- Resize windows
hotkey.bind(mod_shift, "UP", grid.resizeWindowShorter)
hotkey.bind(mod_shift, "DOWN", grid.resizeWindowTaller)
hotkey.bind(mod_shift, "RIGHT", grid.resizeWindowWider)
hotkey.bind(mod_shift, "LEFT", grid.resizeWindowThinner)

-- Snap windows
hotkey.bind(mod, ";", function() grid.snap(window.frontmostWindow()) end)
hotkey.bind(mod, "'", function() fnutils.map(window.visibleWindows(), grid.snap) end)

-- Manually reload configuration
-- Found in the "Getting Started with Hammerspoon" guide (http://www.hammerspoon.org/go/)
hotkey.bind(mod_shift, "R", function()
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
