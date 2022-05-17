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

local speaker -- true if initiator speaking
local textDrawnCb -- invoked when all text rendered 

rpg.dialog = {}

local function drawDialog() 
  initiatorBuffer = ""
  responderBuffer = ""

  initiatorTextOffset = {15, 15}
  responderTextOffset = {225, 180}

  chat = gfx.image.new('assets/chat')
  chat:draw(0, 0)
end

local function renderChar()
  local offset

  if speaker then 
    buf = initiatorBuffer 
    offset = initiatorTextOffset
  else 
    buf = responderBuffer 
    offset = responderTextOffset
  end

  if (buf:len() < 1) then 
    if textDrawnCb ~= nil then textDrawnCb() end
    return 
  end

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

local function drawText(text)
  local offsetFrames = 5;

  for i = 1, text:len() + 1 do
    ft.new(offsetFrames, renderChar)
    offsetFrames = offsetFrames + 5;
  end
end

local function drawInitiatorText(text, cb)
  initiatorBuffer = text
  textDrawnCb = cb
  speaker = true
  drawText(text)
end

local function drawResponderText(text, cb)
  responderBuffer = text
  textDrawnCb = cb
  speaker = false
  drawText(text)
end

function rpg.dialog.conversation(t1, t2, rs, cb)
  drawDialog()
  
  local da
  local db

  if rs then
    db = drawInitiatorText
    da = drawResponderText 
  else
    da = drawInitiatorText
    db = drawResponderText 
  end

  da(t1, function () db(t2, cb) end)
end
