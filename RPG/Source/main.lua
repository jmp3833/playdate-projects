import 'lua/dialog'

local dialog = rpg.dialog

function playdate.update()
  playdate.frameTimer.updateTimers()

  --temp, begin rendering dialog
  dialog.drawDialog()
  dialog.drawInitiatorText("Hey there...")
end
