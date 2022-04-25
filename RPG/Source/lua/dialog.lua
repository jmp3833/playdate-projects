import 'CoreLibs/graphics'
import 'CoreLibs/frameTimer'
import 'assets/chat.png'
import 'lua/rpg'

local gfx = playdate.graphics
local ft = playdate.frameTimer

rpg.dialog = {}

function rpg.dialog.drawDialog() 
  chat = gfx.image.new('assets/chat')
  chat:draw(0, 0)
end

function rpg.dialog.drawInitiatorText(text)
  local textTimer = ft.new(60, renderSegment)
  gfx.drawText(text, 15, 15)
end

function rpg.dialog.drawResponderText(text)
  gfx.drawText(text, 225, 180)
end

function renderSegment()
  print('segment')
end
