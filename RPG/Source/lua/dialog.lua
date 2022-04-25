import 'CoreLibs/graphics'
import 'CoreLibs/frameTimer'
import 'assets/chat.png'
import 'lua/rpg'

local gfx = playdate.graphics
local ft = playdate.frameTimer

local initiatorBuffer

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
  -- todo, pass arg to anon fn
  drawText(initiationBuffer renderSegment, initiationBuffer, initiatorTextOffset)
end

function drawText(buf cb)
  buf = text

  local offset = 30;

  for i = 1, text:len() do
    ft.new(offset, cb)
    offset = offset + 5;
  end
end

function renderSegment(buf, offset)
  print('init')


  if (buf:len() < 1) then
    return
  end

  local c = buf:sub(1, 1)
  gfx.drawText(c, offset[1], offset[2])
  buf = buf:sub(2)
  offset = {offset[1] + 10, offset[2]}
end
