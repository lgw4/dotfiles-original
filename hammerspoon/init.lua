local mash = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "ctrl", "shift"}

-- Center frontmost window
hs.hotkey.bind(mash, "C", function()
  local win = hs.window.frontmostWindow()

  win:centerOnScreen(ensureInScreenBounds)
end)

-- Move frontmost window up
hs.hotkey.bind(mash, "UP", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()

  f.y = f.y - 10
  win:setFrameInScreenBounds(f)
end)

-- Move frontmost window down
hs.hotkey.bind(mash, "DOWN", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()

  f.y = f.y + 10
  win:setFrameInScreenBounds(f)
end)

-- Move frontmost window left
hs.hotkey.bind(mash, "LEFT", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrameInScreenBounds(f)
end)

-- Move frontmost window right
hs.hotkey.bind(mash, "RIGHT", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()

  f.x = f.x + 10
  win:setFrameInScreenBounds(f)
end)

-- Automatically reload configuration on save
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
