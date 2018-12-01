# Implement the classic method for composing secret messages called a square code.

# The input is first normalized: The spaces and punctuation are removed from
#  the English text and the message is down-cased.

# Then, the normalized characters are broken into rows. These rows can be regarded
#  as forming a rectangle when printed with intervening newlines.

# For example, the sentence

# If man was meant to stay on the ground god would have given us roots

# is 54 characters long.

# Broken into 8-character columns, it yields 7 rows.

# Those 7 rows produce this rectangle when printed one per line:

# ifmanwas
# meanttos
# tayonthe
# groundgo
# dwouldha
# vegivenu
# sroots

# The coded message is obtained by reading down the columns going left to right. For example, 
# the message above is coded as:

# imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
# Write a program that, given an English text, outputs the encoded version of that text.

# The size of the square (number of columns) should be decided by the length of the message. 
# If the message is a length that creates a perfect square (e.g. 4, 9, 16, 25, 36, etc), 
# use that number of columns. If the message doesn't fit neatly into a square, choose the number 
# of columns that corresponds to the smallest square that is larger than the number of characters 
# in the message.

# For example, a message 4 characters long should use a 2 x 2 square. A message that is 81 characters 
# long would use a square that is 9 columns wide. A message between 5 and 8 characters long should use 
# a rectangle 3 characters wide.

# Output the encoded text grouped by column.

# input
#   sentence string
# output
#   encoded string

# find number of columns by taking the square root of the length and calling ceil (will round up unless the number ends with .0)

# break the string down in segments stored in arrays in an array of the number above. [[],[],[]]

# unless sqrt(str.size) % 1 == 0, push (sqrt(str).ceil - sub_str.lentgh) numbers of space characters on the last array.  transpose. delete the space chars, join with spaces.
# otherwise transpose the array of arrays, join with spaces

include Math

class Crypto
  attr_accessor :message, :normalized_message

  def initialize(str)
    @message = str
    normalize_plaintext
  end

  def normalize_plaintext
    self.normalized_message = message.downcase.gsub(/[^a-z0-9]/, "")
  end

  def size
    sqrt(normalized_message.size).ceil
  end

  def plaintext_segments
    split_message = normalized_message.chars.each_slice(size).to_a
    split_message.map(&:join)
  end

  def normalize_ciphertext
    segments = plaintext_segments

    if sqrt(normalized_message.size) % 1 == 0
      segments.map { |word| word.split"" }.transpose
    else
      (sqrt(normalized_message.size).ceil - segments[-1].size).times { |_| segments[-1] << " " }
      transposed = segments.map { |word| word.split"" }.transpose

      words_minus_spaces = transposed.map do |seg_chars| 

        if seg_chars.include?(" ")
          seg_chars.delete(" ")
          seg_chars.join
        else
          seg_chars.join
        end
      end

      words_minus_spaces.join" "
    end
  end

  def ciphertext
    normalize_ciphertext.split.join
  end
end

