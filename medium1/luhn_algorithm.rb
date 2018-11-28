# frozen_string_literal: true

# Luhn class
class Luhn
  attr_reader :number

  def initialize(num)
    @number = num
  end

  def subtract_nine(number)
    number = number.to_i * 2
    number -= 9 if number > 9
    number.to_s
  end

  def double_odd_number_index(arr)
    arr.map.with_index do |number, index|
      if index.odd?
        doubled_number = (number.to_i * 2).to_s

        doubled_number.size > 1 ? subtract_nine(number) : doubled_number
      else
        number
      end
    end.map(&:to_i)
  end

  def self.create(number)
    place_holder = number * 10
    luhn = Luhn.new(place_holder)

    return luhn.number if (luhn.checksum % 10).zero?

    check_digit = ((luhn.checksum % 10) - 10).abs.to_s
    number.to_s.chars.push(check_digit).join.to_i
  end

  def addends
    reversed_array = number.to_s.split('').reverse
    doubled_odd_numbers = double_odd_number_index(reversed_array)
    doubled_odd_numbers.reverse.map(&:to_i)
  end

  def checksum
    addends.reduce(&:+)
  end

  def valid?
    (checksum % 10).zero?
  end
end
