local meh = { "ctrl", "alt", "shift" }
local keysByApp = {
	["Google Chrome"] = "b",
	["Ghostty"] = "t",
	["Finder"] = "f",
}

for app, key in pairs(keysByApp) do
	hs.hotkey.bind(meh, key, function()
		hs.application.launchOrFocus(app)
	end)
end
