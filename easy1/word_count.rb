#Write a program that given a phrase can count the occurrences of each word in that phrase.

#For example, if we count the words for the input "olly olly in come free", we should get:

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

class Phrase
  def initialize(string)
    @phrase = string
  end

  def remove_newline
    @phrase.gsub(/\n/, ' ')
  end

  def remove_comma
    @modified_phrase.gsub(/,/, ' ')
  end

  def remove_special_chars
    @modified_phrase.gsub(/[^0-9a-zA-Z ']/, "")
  end

  def remove_quotations
    result = @modified_phrase.split().map do |word|
      if [word[0], word[-1]].all? { |char| char == "'"}
        word[1..-2]
      else
        word
      end
    end

    result.join" "
  end

  def count_words
    result = Hash.new(0)
    @modified_phrase.split(" ").map(&:downcase).each { |key| result[key] += 1}
    result
  end

  def word_count
    @modified_phrase = remove_newline
    @modified_phrase = remove_comma
    @modified_phrase = remove_special_chars
    @modified_phrase = remove_quotations

    count_words
  end
end
