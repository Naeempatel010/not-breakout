Ball = Object:extend()

function Ball:new(x, y)
  self.radius = 12
  self.width = self.radius * 2
  self.height = self.radius * 2
  self.x = x
  self.y = y
  self.xspeed = 300
  self.yspeed = 300
end

function Ball:update(dt)
  local window_width = love.graphics.getWidth()
  local window_height = love.graphics.getHeight()
  self.x = self.x + self.xspeed * dt
  if self.x + self.radius * 2 > window_width or self.x < 0 then
    self.xspeed = -self.xspeed
  end
  self.y = self.y + self.yspeed * dt
  if self.y + self.radius * 2 > window_height or self.y < 0 then
    self.yspeed = -self.yspeed
  end
end

function Ball:checkCollision(b)
  local hasCollided = self.x < b.x + b.width and
	b.x < self.x + self.width and
	self.y < b.y + b.height and
	b.y < self.y + self.height
  if hasCollided == true then
    self.yspeed = -self.yspeed
  end
  return hasCollided
end

function Ball:draw()
  love.graphics.circle("fill", self.x, self.y, self.radius)
end
