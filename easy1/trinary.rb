# rubocop:disable Metrics/LineLength

# Write a program that will convert a trinary number, represented as a string (e.g. '102012'),
# to its decimal equivalent using first principles (without using an existing method or library
# that can work with numeral systems).

# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should
# convert to decimal number 0.

# The last place in a trinary number is the 1's place. The second to last is the 3's place,
# the third to last is the 9's place, etc.

# # "102012"
#     1       0       2       0       1       2    # the number
# 1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2 =  302

# split string and reverse
# map each str to int
# map with index each num * (3 ** index)
# reduce and return

# rubocop:enable Metrics/LineLength

class Trinary
  attr_reader :number

  def initialize(num_string)
    @number = num_string
  end

  def to_decimal
    return 0 if number.match(/[^012]/)
    reversed_chars = number.chars.reverse
    reversed_integers = reversed_chars.map(&:to_i)

    mult_collection_by_power = reversed_integers.map.with_index do |int, index|
      int * (3**index)
    end

    mult_collection_by_power.reduce(&:+)
  end
end
