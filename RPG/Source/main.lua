import 'lua/dialog'
import 'CoreLibs/timer'

local dialog = rpg.dialog

--temp, begin rendering dialog
dialog.conversation("Hey there", 
  "nice to see u", 
  false,
  function () 
    print('next set')
    dialog.conversation("Another response", "I see...", true) 
  end)

function playdate.update()
  playdate.frameTimer.updateTimers()
  playdate.timer.updateTimers()
end
