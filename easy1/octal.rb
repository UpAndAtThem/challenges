# split number string into individual integers
# reverse split numbers
# map over with index and multiply each digit with the coresponding power of 8 (index)
# add numbers together

class Octal
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def mult_by_power_of_eight(collection)
    collection.map.with_index do |num, index|
      num * (8 ** index)
    end
  end

  def to_decimal
    return 0 if number.match(/[^0-7]/)

    num_arr = number.chars.reverse.map(&:to_i)

    mult_by_power_of_eight(num_arr).reduce(&:+)
  end
end
