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
