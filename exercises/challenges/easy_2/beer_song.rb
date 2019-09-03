# class BeerSong
#  - initialize
#    - Input: none
#    - Output: none
#    Creates an instance variable @lyrics that creates all the lyrics
#  - verse
#    - Input: An integer
#    - Output: A verse for that integer
#    Returns a slice of @lyrics
#  - verses
#    - Input: Two integers representing a range
#    - Output: A lyric for each integer in the range
#    Algorithm
#    Create a range from start number to ending number
#    Loop through the range
#      Map current_range to verse of that current_range
#    Return lyrics as a string
#  - lyrics
#    - Input: None                                
#    - Output: all verses to 99 bottles
#    - Outputs a string of @lyrics
#  - private method create_lyrics
#    - Input: None
#    - Output: An array of song lyrics from 99 to 0
#    Algorithm:
#      0. Assign string with special case of 2 to two_bottles
#      1. Assign string with special case of 1 to one_bottle
#      2. Assign string with special case of 0 to no_bottles
#      3. Create a new array verses
#      4. Loop from 99 to 0
#          If current number is 2
#            Add two_bottles to verses
#      5.  Else if current number is 1
#      6.    Add one_bottle to verses
#      7.  Else if current number is 0
#      8.    Add no_bottles to verses
#      9.  Else
#      10.   Add to verses "#{current_number} bottles of beer on the wall, #{current_number} bottles of beer.\n" \
#"Take one down and pass it around, #{current_number-1} bottles of beer on the wall.\n"
#      11. Return verses

class BeerSong
  def initialize
    @lyrics = create_lyrics
  end

  def verse(line)
    @lyrics.reverse[line..line].join("\n")
  end

  def verses(starting, ending)
    verses = []
    
    starting.downto(ending) do |current_verse|
      verses << verse(current_verse)
    end

    verses.join("\n")
  end

  def lyrics
    @lyrics.join("\n")
  end

  private

  def create_lyrics
    two_bottles = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
                  "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    
    one_bottle = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
                 "Take it down and pass it around, no more bottles of beer on the wall.\n"

    no_bottles = "No more bottles of beer on the wall, no more bottles of beer.\n" \
                 "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

    verses = []

    99.downto(0) do |current_number|
      if current_number == 2
        verses << two_bottles
      elsif current_number == 1
        verses << one_bottle
      elsif current_number == 0
        verses << no_bottles
      else
        verses << "#{current_number} bottles of beer on the wall, #{current_number} bottles of beer.\n" \
      "Take one down and pass it around, #{current_number-1} bottles of beer on the wall.\n"
      end
    end

    verses
  end
end

# p BeerSong.new.verse(1, 2)
p BeerSong.new.verse(99)
p BeerSong.new.verse(3)

    
