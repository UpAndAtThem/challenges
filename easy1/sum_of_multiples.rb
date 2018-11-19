# Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but 
# not including that number.

# If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5,
# we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of numbers. 
# If no set of numbers is given, default to 3 and 5.


# Set_Multiples: set which multiples are used by explicitly passing them one by one into :new
#              : if no arguments are passed to new, us multiples 3 and 5

# Sum_of_the_Multiples: determeine sum of the multiples from 2 to 1 less the number provided by the #to method.

# noun
#   number_range
#   multiples
# verb
#   sum_multiples

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(end_exclusive_range, multiples = [3, 5])
    sum = 0

    (1...end_exclusive_range).each do |test_num|
      sum += test_num if multiples.any? { |multiple| test_num % multiple == 0 }
    end

    sum
  end

  def to(end_exclusive_range)
    SumOfMultiples.to(end_exclusive_range, @multiples)
  end
end
