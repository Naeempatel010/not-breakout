function love.load()
  Object = require "libs/classic/classic"

  require "paddle"
  require "ball"
  require "block"
  
  love.window.setTitle("Not Breakout")

  blocks = {}
  for i = 50, 700, 125 do
    table.insert(blocks, Block(i, 100))
    table.insert(blocks, Block(i, 50))
    table.insert(blocks, Block(i, 150))
  end
  
  ball = Ball(300, 450)
  paddle = Paddle(300, 500)
end

function love.update(dt)
  paddle:update(dt)
  ball:checkCollision(paddle)
  for i, blk in ipairs(blocks) do
    if blk:checkCollision(ball) and ball:checkCollision(blk) then
      table.remove(blocks, i)
    end
  end
  ball:update(dt)
end

function love.draw()
  ball:draw()
  paddle:draw()
  for i, blk in ipairs(blocks) do
    blk:draw()
  end
end
