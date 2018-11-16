class SecretHandshake
  MOVES = {-1 => 'wink', -2 => 'double blink', -3 => 'close your eyes', -4 => 'jump'}
  MIN_POSITION = -5

  def initialize(number)
    @sequence = set_binary number
  end

  def set_binary(number)
    number.class == String ? number : number.to_s(2)
  end

  def commands
    sequence = []
    position = -1
    binary_arr = @sequence.chars

    loop do
      if binary_arr[position] == '1' && position == MIN_POSITION
        sequence.reverse!
      elsif binary_arr[position] == '1'
        sequence << MOVES[position]
      end

      break if position <= MIN_POSITION
      position -= 1
    end

    sequence
  end
end
