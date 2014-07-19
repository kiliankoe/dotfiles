require "grid"
hydra.douserfile("menuconfig")

pathwatcher.new(os.getenv("HOME") .. "/.hydra/", hydra.reload):start()
autolaunch.set(true)

local mash = {"cmd", "alt", "ctrl"}
local monkey = {"cmd", "alt", "shift"}
local ctrlcmd = {"ctrl", "cmd"}
local all = {"cmd", "alt", "ctrl", "shift"}


hotkey.bind(ctrlcmd, 'K', ext.grid.fullscreen)
hotkey.bind(ctrlcmd, 'H', ext.grid.lefthalf)
hotkey.bind(ctrlcmd, 'J', ext.grid.bottomhalf)
hotkey.bind(ctrlcmd, 'L', ext.grid.righthalf)
hotkey.bind(ctrlcmd, 'P', ext.grid.pushwindow)

hotkey.bind(ctrlcmd, 'N', ext.grid.topleft)
hotkey.bind(ctrlcmd, 'M', ext.grid.bottomleft)
hotkey.bind(ctrlcmd, ',', ext.grid.topright)
hotkey.bind(ctrlcmd, '.', ext.grid.bottomright)

hotkey.bind(mash, 'R', function() repl.open(); logger.show() end)

hotkey.bind(mash, 'X', logger.show)
hotkey.bind(mash, "R", repl.open)


local function opendictionary()
  hydra.alert("Lexicon, at your service.", 0.75)
  application.launchorfocus("Dictionary")
end

hotkey.bind(mash, 'D', opendictionary)


-- Donate via Bitcoin to the creator of Hydra: 18LEhURYNgkC9PPdtdXShDoyaHXGaLENe7
