# words must be 20 letters or less. and words are only letters.
# words are seperated by 1 or more spaces
# the last word ends with 0 or more spaces with a period.
# musts print each word one at a time

def odd_words(str)
  raise ArgumentError if str.split.any? { |word| word.length > 20}
  raise ArgumentError unless str.split("").all? { |char| char.match(/\w| |\./)}

  word_number = 0
  index = 0
  current_word = ''

  loop do
    current_char = str[index]

    if current_char.match(/\w/)
      current_word << current_char
      index += 1
    elsif current_char == ' '      
      loop do
        index += 1
        break if str[index].match(/[a-zA-Z]/) || str[index] == '.'
      end

      current_char = str[index]

      print(word_number.odd? ? current_word.reverse : current_word)

      print " " unless current_char == '.'

      word_number += 1
      current_word = ''
    else current_char == '.'
      print((word_number.odd? ? current_word.reverse : current_word) + ".\n")
      index += 1
    end

    break if index >= str.length
  end
end

odd_words "whats     kansas     ."