# rubocop:disable Metrics/LineLength

# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

# Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and over:

# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)
# Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm.

# Notice that this is a very specific algorithm, and the tests don't check that you've implemented the algorithm, only that you've come up with the correct list of primes.

# Sieve#primes - using the sieve of eratosthenes algorithm return list of primes from 1 upto upperbound

# starting with 2, the first prime number, push to list of primes
# iterate by self over the remainder of the numbers and label each number as marked
# if the number is not marked when it arrives at the number, push to primes array, and iterate by self marking each number it lands as marked.

# rubocop:enable Metrics/LineLength

class Sieve
  attr_reader :upper_bound, :prime_numbers, :range_hash

  def initialize(upper_bound)
    @upper_bound = upper_bound
    @prime_numbers = []
    @range_hash = create_range_hash
  end

  def create_range_hash
    range = (2..upper_bound).to_a
    empty_string = range.map { |_| '' }

    Hash[range.zip empty_string]
  end

  def push_prime(number)
    prime_numbers << number
  end

  def label_as_marked(marker)
    marker << 'marked'
  end

  def marked?(mark_status)
    mark_status == 'marked'
  end

  def label_all_composites(number)
    ((number + number)..upper_bound).step(number) do |composite|
      range_hash[composite] = 'marked'
    end
  end

  def primes
    range_hash.each do |(number, marker)|
      next if marked? marker
      push_prime(number) if marker.empty?
      label_as_marked marker
      label_all_composites number
    end

    prime_numbers
  end
end
