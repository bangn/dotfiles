-- luacheck: ignore 113

local metaKey = { "cmd", "ctrl" }
hs.application.enableSpotlightForNameSearches(true)

--------------------------------------------------------------------------------
-- Hot reload Hammerspon
--------------------------------------------------------------------------------
hs.hotkey.bind(metaKey, "R", function()
  hs.reload()
end, nil, "Reload Hammerspoon")

--------------------------------------------------------------------------------
-- Open Ghostty
--------------------------------------------------------------------------------
hs.hotkey.bind(metaKey, hs.keycodes.map["return"], function()
  hs.application.launchOrFocus("ghostty")
end)

--------------------------------------------------------------------------------
-- Moving window
--------------------------------------------------------------------------------
local moveWindow = function(xFactor, yFactor, wFactor, hFactor)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * xFactor)
  f.y = max.y + (max.h * yFactor)
  f.w = max.w * wFactor
  f.h = max.h * hFactor
  win:setFrame(f)
end

local fullScreen = function()
  local win = hs.window.focusedWindow()
  win:maximize()
end

local leftHalf = function()
  moveWindow(0, 0, 0.5, 1)
end

local rightHalf = function()
  moveWindow(0.5, 0, 0.5, 1)
end
local topHalf = function()
  moveWindow(0, 0, 1, 0.5)
end
local bottomHalf = function()
  moveWindow(0, 0.5, 1, 0.5)
end

hs.hotkey.bind(metaKey, "up", fullScreen)
hs.hotkey.bind(metaKey, "left", leftHalf)
hs.hotkey.bind(metaKey, "right", rightHalf)
hs.hotkey.bind(metaKey, "k", topHalf)
hs.hotkey.bind(metaKey, "j", bottomHalf)

--------------------------------------------------------------------------------
-- Moving screen
--------------------------------------------------------------------------------
local moveToScreen = function(direction)
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local targetScreen = direction == "next" and screen:next() or screen:previous()
  win:moveToScreen(targetScreen)
end

hs.hotkey.bind(metaKey, "n", function()
  moveToScreen("next")
end)
hs.hotkey.bind(metaKey, "p", function()
  moveToScreen("previous")
end)
