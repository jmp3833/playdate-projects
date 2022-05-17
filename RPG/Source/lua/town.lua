--25 x 15, 16px blocks each
import 'CoreLibs/graphics'
import 'CoreLibs/frameTimer'
import 'lua/rpg'

rpg.town = {}

local gfx = playdate.graphics
local GRID_PX = 40 
local ROWS = 10 
local COLS = 6 

function rpg.town.drawGrid()
  w = false
  x = 0
  y = 0

  for i = 0, ROWS do
    for j = 0, COLS do
      if w then
	      gfx.setColor(gfx.kColorWhite)
      else
	      gfx.setColor(gfx.kColorBlack)
      end

      gfx.drawRect(x, y, GRID_PX, GRID_PX)
      gfx.fillRect(x, y, GRID_PX, GRID_PX)

      x = x + GRID_PX

      if x > 400 then
        y = y + GRID_PX
        x = 0
      end

      if w then w = false else w = true end
    end
  end
end
