import 'lua/dialog'
import 'CoreLibs/timer'

local dialog = rpg.dialog

--temp, begin rendering dialog
dialog.drawDialog()

dialog.drawInitiatorText("Hey there...")
dialog.drawResponderText("Nice to see u")

function playdate.update()
  playdate.frameTimer.updateTimers()
  playdate.timer.updateTimers()
end
