import 'CoreLibs/graphics'
import 'CoreLibs/frameTimer'
import 'assets/chat.png'
import 'lua/rpg'

local gfx = playdate.graphics
local ft = playdate.frameTimer

local initiatorBuffer
local initiatorTextOffset

local responderBuffer
local responderTextOffset

local speaker

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
  speaker = true
  drawText(text)
end

function rpg.dialog.drawResponderText(text)
  responderBuffer = text
  speaker = false
  drawText(text)
end

function drawText(text)
  local offsetFrames = 5;

  for i = 1, text:len() do
    ft.new(offsetFrames, renderSegment)
    offsetFrames = offsetFrames + 5;
  end
end

function renderSegment()
  local offset

  if speaker then 
    buf = initiatorBuffer 
    offset = initiatorTextOffset
  else 
    buf = responderBuffer 
    offset = responderTextOffset
  end

  if (buf:len() < 1) then return end

  local c = buf:sub(1, 1)
  gfx.drawText(c, offset[1], offset[2])
  buf = buf:sub(2)
  offset = {offset[1] + 10, offset[2]}

  if speaker then 
    initiatorBuffer = buf
    initiatorTextOffset = offset
  else 
    responderBuffer = buf
    responderTextOffset = offset
  end
end
