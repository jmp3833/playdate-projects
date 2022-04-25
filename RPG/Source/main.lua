import 'lua/dialog'
import 'CoreLibs/timer'

local dialog = rpg.dialog

--temp, begin rendering dialog
dialog.drawDialog()
dialog.drawInitiatorText("Hey there cassandra...")


function playdate.update()
  playdate.frameTimer.updateTimers()
  playdate.timer.updateTimers()
end
