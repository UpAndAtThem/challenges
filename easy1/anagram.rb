class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def sort(word)
    word.chars.sort.join
  end

  def match(word_arr)
    word_arr.select do |test_word|
      unless test_word.downcase == word
        sort(test_word.downcase) == sort(word)
      end
    end
  end
end
