hs.hotkey.bind({"command"}, "`", function()
    local alacritty = hs.application.find('alacritty')
    local awin = alacritty:mainWindow()
    if awin and alacritty:isFrontmost() then
      alacritty:hide()
    else
      alacritty = hs.application.launchOrFocus("/Applications/Alacritty.app")
    end
  end)