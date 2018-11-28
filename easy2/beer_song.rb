class BeerSong
  attr_reader :song_lyrics

  def initialize
    @song_lyrics = ''
  end

  def multiple_bottles_verse(beer_num)
    is_plural = (beer_num - 1) > 1

    "#{beer_num} bottles of beer on the wall, #{beer_num} bottles of beer." \
    "\nTake one down and pass it around, " \
    "#{beer_num - 1} bottle#{is_plural ? 's' : ''} of beer on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def no_bottles_verse
    "No more bottles of beer on the wall, no more bottles of beer." \
    "\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def lyrics
    verses(99, 2) << "\n"
    song_lyrics << single_bottle_verse << "\n"
    song_lyrics << no_bottles_verse

    song_lyrics
  end

  def verse(number)
    requested_verse = if number == 0
                        no_bottles_verse
                      elsif number == 1
                        single_bottle_verse
                      else
                        multiple_bottles_verse number
                      end

    requested_verse
  end

  def verses(high_range, low_range)
    high_range.downto(low_range) do |beer_num|
      song_lyrics << verse(beer_num)
      song_lyrics << "\n" unless beer_num == low_range
    end

    song_lyrics
  end
end
