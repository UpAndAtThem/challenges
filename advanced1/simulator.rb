# simulator
#  -instructions
#  -place(robot, x: val, y: val, direction: :east)
#  -evaluate(robot, 'RLAALA')

class Simulator
  MOVES = { 'L' => :turn_left,
            'R' => :turn_right,
            'A' => :advance }

  def initialize
    @grid = Hash.new([])
  end

  def instructions(navigation_string)
    navigation_string.chars.map { |letter| MOVES[letter] }
  end

  def place(robot, x: x_coord, y: y_coord, direction: :cardinal_direction)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, navigation_string)
    moves = instructions navigation_string

    moves.each do |move|
      case move
      when :advance    then robot.advance
      when :turn_left  then robot.turn_left
      when :turn_right then robot.turn_right
      end
    end
  end
end
