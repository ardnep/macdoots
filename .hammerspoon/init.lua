hs.hotkey.bind({ "cmd" }, "return", function()
	local kitty = hs.application.find("kitty")
	if not kitty then
		kitty = hs.application.open("/Applications/Kitty.app/")
	end
	if kitty:isFrontmost() then
		kitty:hide()
	else
		kitty:activate()
	end
end)

--------------------------------
-- START VIM CONFIG
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
vim:disableForApp("Code")
	:disableForApp("zoom.us")
	:disableForApp("iTerm")
	:disableForApp("iTerm2")
	:disableForApp("Terminal")
	:disableForApp("kitty")
	:disableForApp("Alacritty")
	:disableForApp("Obsidian")

-- If you want the screen to dim (a la Flux) when you enter normal mode
-- flip this to true.
vim:shouldDimScreenInNormalMode(false)

-- If you want to show an on-screen alert when you enter normal mode, set
-- this to true
vim:shouldShowAlertInNormalMode(true)

-- You can configure your on-screen alert font
vim:setAlertFont("FiraCode Nerd Font Mono")

-- Enter normal mode by typing a key sequence
vim:enterWithSequence("jk")
-- vim:bindHotKeys({ enter = { {}, "escape" } })

-- if you want to bind a single key to entering vim, remove the
-- :enterWithSequence('jk') line above and uncomment the bindHotKeys line
-- below:
--
-- To customize the hot key you want, see the mods and key parameters at:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
--
-- vim:bindHotKeys({ enter = { {'ctrl'}, ';' } })

--------------------------------
-- END VIM CONFIG
--------------------------------
