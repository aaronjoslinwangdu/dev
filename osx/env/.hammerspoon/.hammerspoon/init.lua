local meh = {"ctrl", "alt", "shift"}

-- Browser
hs.hotkey.bind(meh, "b", function()
  hs.application.launchOrFocus("Google Chrome")
end)

-- Terminal
hs.hotkey.bind(meh, "t", function()
  hs.application.launchOrFocus("Ghostty")
end)

-- Finder
hs.hotkey.bind(meh, "f", function()
  hs.application.launchOrFocus("Finder")
end)
