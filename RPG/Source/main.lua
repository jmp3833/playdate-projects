import 'CoreLibs/timer'
import 'lua/town'
import 'lua/dialog'

local dialog = rpg.dialog
local town = rpg.town

--[[temp, draw a dialog between two people

dialog.conversation("Hey there", 
  "nice to see u", 
  false,
  function () 
    dialog.conversation("Another response", "I see...", true) 
  end)

]]--

--temp, draw a town map
town.drawGrid()

function playdate.update()
  playdate.frameTimer.updateTimers()
  playdate.timer.updateTimers()
end
