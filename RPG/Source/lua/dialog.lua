import 'CoreLibs/graphics'
import 'CoreLibs/frameTimer'
import 'assets/chat.png'
import 'lua/rpg'

local gfx = playdate.graphics
local ft = playdate.frameTimer

local initiatorBuffer
local initiatorTextOffset

rpg.dialog = {}

function rpg.dialog.drawDialog() 
  initiatorBuffer = ""
  responderBuffer = ""

  initiatorTextOffset = {15, 15}
  responderTextOffset = {225, 180}

  chat = gfx.image.new('assets/chat')
  chat:draw(0, 0)
end

function rpg.dialog.drawInitiatorText(text)
  initiatorBuffer = text
  local offsetFrames = 5;

  for i = 1, text:len() do
    ft.new(offsetFrames, renderSegment)
    offsetFrames = offsetFrames + 5;
  end
end

function renderSegment()
  if (initiatorBuffer:len() < 1) then
    return
  end

  local c = initiatorBuffer:sub(1, 1)
  gfx.drawText(c, initiatorTextOffset[1], initiatorTextOffset[2])
  initiatorBuffer = initiatorBuffer:sub(2)
  initiatorTextOffset = {initiatorTextOffset[1] + 10, initiatorTextOffset[2]}
end
