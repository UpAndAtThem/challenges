# Implement run-length encoding and decoding.

# Run-length encoding (RLE) is a simple form of data compression, where runs (consecutive data elements) are replaced by just one data value and count.

# For example we can represent the original 53 characters with only 13.

# "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"
# RLE allows the original data to be perfectly reconstructed from the compressed data, which makes it a lossless data compression.

# "AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"

# break str into chars
# shift the first value and set as current_char
# push
# iterate over remaining chars
  #
  require 'pry'

class RunLengthEncoding
  def self.encode(str)
    grouped_chars = []
    current_chars = []

    char_collection = str.chars

    char_collection.each_with_index do |char, index|
      if current_chars.empty?
        current_chars << char
      elsif char == current_chars[0]
        current_chars << char
      else
        grouped_chars << current_chars
        current_chars = [char]
      end

      grouped_chars << current_chars if index >= str.length - 1
    end

    grouped_chars.map{ |arr| arr.size == 1 ? arr[0] : arr.size.to_s + arr[0]}.join
  end

  def self.decode(str)
    return_string = ''

    pairs = str.scan(/([0-9]*)(\X)/).each do |number, unicode|
      if number == ''
        return_string << unicode
      else
        return_string << unicode * number.to_i
      end
    end

    return_string
  end
end

