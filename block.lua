Block = Object:extend()

function Block:new(x, y)
  self.x = x
  self.y = y
  self.width = 100
  self.height = 32
end

function Block:checkCollision(b)
  return self.x < b.x + b.width and
	b.x < self.x + self.width and
	self.y < b.y + b.height and
	b.y < self.y + self.height
end

function Block:draw()
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end
