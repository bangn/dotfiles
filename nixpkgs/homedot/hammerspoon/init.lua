metaKey = { "cmd", "ctrl" }
hs.application.enableSpotlightForNameSearches(true)

--------------------------------------------------------------------------------
-- Hot reload Hammerspon
--------------------------------------------------------------------------------
hs.hotkey.bind(metaKey, "R", function()
	hs.reload()
end)

--------------------------------------------------------------------------------
-- Open alacritty
--------------------------------------------------------------------------------
hs.hotkey.bind(metaKey, hs.keycodes.map["return"], function()
	hs.application.launchOrFocus("alacritty")
end)

--------------------------------------------------------------------------------
-- Moving window
--------------------------------------------------------------------------------
-- Fullscreen
hs.hotkey.bind(metaKey, "f", function()
	local win = hs.window.focusedWindow()
	win:maximize()
end)

-- Half left
hs.hotkey.bind(metaKey, "h", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

-- Half right
hs.hotkey.bind(metaKey, "l", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

-- Top half
hs.hotkey.bind(metaKey, "k", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y / 2
	f.w = max.w
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Bottom half
hs.hotkey.bind(metaKey, "j", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y + (max.h / 2)
	f.w = max.w
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Middle of screen
hs.hotkey.bind(metaKey, "m", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y + (max.h / 5)
	f.w = max.w
	f.h = max.h * 2 / 3
	win:setFrame(f)
end)

-- Move to next screen
hs.hotkey.bind(metaKey, "n", function()
	local win = hs.window.focusedWindow()
	local screen = win:screen()
	local nextScreen = screen:next()

	win:moveToScreen(nextScreen)
end)

-- Move to previous screen
hs.hotkey.bind(metaKey, "p", function()
	local win = hs.window.focusedWindow()
	local screen = win:screen()
	local previousScreen = screen:previous()

	win:moveToScreen(previousScreen)
end)
