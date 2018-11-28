# robot
# - orient(:west)
# - at(x,y)
# - bearing
# - turn_right
# - turn_left
# - advance
# - coordinates

class Robot
  TURNING = { north: { 'turn_left' => :west, 'turn_right' => :east },
              south: { 'turn_left' => :east, 'turn_right' => :west },
              east:  { 'turn_left' => :north, 'turn_right' => :south },
              west:  { 'turn_left' => :south, 'turn_right' => :north } }

  DIRECTIONS = [:north, :south, :east, :west]

  attr_accessor :bearing, :x, :y

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include? direction
    @bearing = direction
  end

  def at(x, y)
    raise ArgumentError unless [x, y].all? { |num| num.class == Integer }
    self.x = x
    self.y = y
  end

  def turn_right
    @bearing = TURNING[@bearing]['turn_right']
  end

  def turn_left
    @bearing = TURNING[@bearing]['turn_left']
  end

  def advance
    case @bearing
    when :north then @y += 1
    when :south then @y -= 1
    when :east  then @x += 1
    when :west  then @x -= 1
    end
  end

  def coordinates
    [x, y]
  end
end
