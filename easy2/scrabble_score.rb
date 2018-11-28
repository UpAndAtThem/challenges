# rubocop:disable Metrics/LineLength

# Write a program that, given a word, computes the scrabble score for that word.

# Letter Values
# You'll need these:

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Examples
# "cabbage" should be scored as worth 14 points:

# 3 points for C
# 1 point for A, twice
# 3 points for B, twice
# 2 points for G
# 1 point for E
# And to total:

# 3 + 2*1 + 2*3 + 2 + 1
# = 3 + 2 + 6 + 3
# = 5 + 9
# = 14

# input
#   word (letters letters only case insensitive)
# output
#   word_score

# set up constant LETTERS_WORTH where key is the letter value (int) and the value is the collection of letters worth that amount
# set up VALUES arr that contains all possible values

# split word into char groups
# map over collection of letters arrays (arr of arr) to contain value of sum of letters
# reduce return arr +

# rubocop:enable Metrics/LineLength

class Scrabble
  attr_reader :word

  LETTERS_WORTH = { 1 => %w[A E I O U L N R S T],
                    2 => %w[D G],
                    3 => %w[B C M P],
                    4 => %w[F H V W Y],
                    5 => %w[K],
                    8 => %w[J X],
                    10 => %w[Q Z] }

  def initialize(word)
    @word = word
  end

  def get_val(letter)
    LETTERS_WORTH.keys.each do |value|
      return value if LETTERS_WORTH[value].include? letter
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def invalid_str
    word.nil? || word.empty? || word.match(/\s/)
  end

  def score
    return 0 if invalid_str

    grouped_letters = word.upcase.chars.group_by { |letter| letter }.values

    grouped_letters.map do |group|
      letter_val = get_val group[0]
      letter_val * group.length
    end.reduce(&:+)
  end
end
