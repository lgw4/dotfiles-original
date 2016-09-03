local application = require "hs.application"
local fnutils = require "hs.fnutils"
local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
local mjomatic = require "hs.mjomatic"
local window = require "hs.window"

grid.setGrid('16x10', 'Color LCD')

local mash = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "ctrl", "shift"}

--
-- toggle push window to edge and restore to screen
--

-- somewhere to store the original position of moved windows
local origWindowPos = {}

-- cleanup the original position when window restored or closed
local function cleanupWindowPos(_,_,_,id)
  origWindowPos[id] = nil
end

-- function to move a window to edge or back
local function movewin(direction)
  local win = hs.window.focusedWindow()
  local res = hs.screen.mainScreen():frame()
  local id = win:id()

  if not origWindowPos[id] then
    -- move the window to edge if no original position is stored in
    -- origWindowPos for this window id
    local f = win:frame()
    origWindowPos[id] = win:frame()

    -- add a watcher so we can clean the origWindowPos if window is closed
    local watcher = win:newWatcher(cleanupWindowPos, id)
    watcher:start({hs.uielement.watcher.elementDestroyed})

    if direction == "left" then f.x = (res.w - (res.w * 2)) + 10 end
    if direction == "right" then f.x = (res.w + res.w) - 10 end
    if direction == "down" then f.y = (res.h + res.h) - 10 end
    win:setFrame(f)
  else
    -- restore the window if there is a value for origWindowPos
    win:setFrame(origWindowPos[id])
    -- and clear the origWindowPos value
    cleanupWindowPos(_,_,_,id)
  end
end

hs.hotkey.bind(mash, "A", function() movewin("left") end)
hs.hotkey.bind(mash, "D", function() movewin("right") end)
hs.hotkey.bind(mash, "S", function() movewin("down") end)
--
-- /toggle push window to edge and restore to screen
--

--
-- Window management
--
--Alter gridsize
-- hotkey.bind(mashshift, '=', function() grid.adjustHeight( 1) end)
-- hotkey.bind(mashshift, '-', function() grid.adjustHeight(-1) end)
-- hotkey.bind(mash, '=', function() grid.adjustWidth( 1) end)
-- hotkey.bind(mash, '-', function() grid.adjustWidth(-1) end)

--Snap windows
hotkey.bind(mash, ';', function() grid.snap(window.focusedWindow()) end)
hotkey.bind(mash, "'", function() fnutils.map(window.visibleWindows(), grid.snap) end)

-- hotkey.bind(mashshift, 'H', function() window.focusedWindow():focusWindowWest() end)
-- hotkey.bind(mashshift, 'L', function() window.focusedWindow():focusWindowEast() end)
-- hotkey.bind(mashshift, 'K', function() window.focusedWindow():focusWindowNorth() end)
-- hotkey.bind(mashshift, 'J', function() window.focusedWindow():focusWindowSouth() end)

hotkey.bind(mash, 'C', function()
  window.frontmostWindow():centerOnScreen(ensureInScreenBounds)
end)

--Move windows
hotkey.bind(mash, 'DOWN', grid.pushWindowDown)
hotkey.bind(mash, 'UP', grid.pushWindowUp)
hotkey.bind(mash, 'LEFT', grid.pushWindowLeft)
hotkey.bind(mash, 'RIGHT', grid.pushWindowRight)

--resize windows
hotkey.bind(mashshift, 'UP', grid.resizeWindowShorter)
hotkey.bind(mashshift, 'DOWN', grid.resizeWindowTaller)
hotkey.bind(mashshift, 'RIGHT', grid.resizeWindowWider)
hotkey.bind(mashshift, 'LEFT', grid.resizeWindowThinner)

hotkey.bind(mash, 'N', grid.pushWindowNextScreen)
hotkey.bind(mash, 'P', grid.pushWindowPrevScreen)

-- hotkey.bind(mashshift, 'M', grid.maximizeWindow)
--
-- /Window management
--

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
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

hs.hotkey.bind({"cmd", "alt"}, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)
