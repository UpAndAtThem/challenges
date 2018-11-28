# rubocop:disable Metrics/LineLength

# Write a program that given a phrase can count the occurrences of each word in that phrase.

# For example, if we count the words for the input "olly olly in come free", we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

# INPUT
#   string
# OUTPUT
#   list of individual word instnace followed by number of occurances in total string, with a colon between. in descending order.

# remove any non alpha characters and spaces
# Split string into individual words array named words
# initialize a new hash with 0 being the initialized value named word_and_count
# iterate over words
#   reference each word as word_and_count key and increment value by one
# invoke the map method

# Phrase#word_count
#   returns a hash with word as key, and count as value
# Phrase
#   takes in a string during instantiation

# rubocop:enable Metrics/LineLength

class Phrase
  def initialize(string)
    @phrase = string
    @words_list = create_list
  end

  def word_count
    @words_list.each_with_object(Hash.new(0)) do |word, result|
      result[word] += 1
    end
  end

  def create_list
    @phrase.scan(/'?\w+'?\w*'?/).map(&:downcase).map do |word|
      word.match(/'\w+'?\w*'/) ? word[1..-2] : word
    end
  end
end
