# Perfect Number
# The Greek mathematician Nicomachus devised a classification scheme for natural numbers, 
# identifying each as belonging uniquely to the categories of abundant, perfect, or deficient. 
# A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields 
# the target number, excluding the number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
# Write a program that can tell if a number is perfect, abundant or deficient.

# INPUT
#   integer
# OUTPUT
#   'perfect', 'deficient', 'abundant'


# create list of divisors from the input integer
# add divisors together (not including self)
# if sum equals input int return perfect
# if sum is less than input return deficient
# else return abundant

class PerfectNumber
  require 'prime'

  def self.sum_divisors(int)
    divisors = 1.upto(int - 1).with_object([]) do |possible_divisor, divisors|
      divisors << possible_divisor if int % possible_divisor == 0
    end

    divisors.reduce(&:+)
  end

  def self.classify(int)
    raise RuntimeError if int < 0

    sum_divisors = sum_divisors int

    if sum_divisors == int
      'perfect'
    elsif sum_divisors < int
      'deficient'
    else
      'abundant'
    end
  end
end


