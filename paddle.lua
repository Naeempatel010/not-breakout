Paddle = Object:extend()

function Paddle:new(x, y)
  self.width = 200
  self.height = 32
  self.x = x
  self.y = y
  self.speed = 350
end

function Paddle:update(dt)
  local mouse = {}
  mouse.x, mouse.y = love.mouse.getPosition()
  self.x = mouse.x
  if self.x < 0 then
    self.x = 0
  end
  if self.x + self.width > love.graphics.getWidth() then
    self.x = love.graphics.getWidth() - self.width
  end
end

function Paddle:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
