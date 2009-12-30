local v2 = require 'dokidoki.v2'

assert(turn_speed, 'missing turn_speed argument')
assert(accel, 'missing accel argument')

velocity = v2(0, 0)

-- 1 for left, -1 for right
function turn(direction)
  self.transform.facing =
    v2.norm(v2.rotate(self.transform.facing, turn_speed * direction))
end

function thrust()
  velocity = velocity + self.transform.facing * accel
end

function update()
  velocity = velocity * 0.97
  self.transform.pos = self.transform.pos + velocity
end
