# House
#
# Write a program that outputs the nursery rhyme "This is the House that Jack Built".

# Notes:
# Let's start backwards
# First element can be a special case because that array only has one element
# Maybe we should use the strings: one for current part, one for last part, one for final rhyme
# Then we can prepend to current part

# Create variable for final_rhyme
# Loop from -1 to -(pieces.length)
   # Get array slice from current number to end of array (-1)

  # flatten slice
  # Separate subject from the last line
  # The whole_line is an array. We want to create a nested array.
  # Create middle array
  #   Create each slice of whole_line
  #   Add to middle array
  # Map middle array
  #   Join inner arrays with space
  # Join outer arrays with "\n"

   # adds "This is" + first to final_rhyme
   # adds middle
   # adds last
   # adds '.'
   # adds "\n\n"

class House

  def self.recite
    new.recite
  end

  def recite

    final_rhyme = ''

    1.upto(pieces.length) do |index|

      whole_line = pieces[-index..-1].flatten
      first = whole_line.shift
      last = whole_line.pop(2).join(" ")

      middle = []
      whole_line.each_slice(2) { |current| middle << current }

      final_rhyme << "This is #{first}"
      final_rhyme << "\n" if index > 1
      final_rhyme << middle.map {|x| x.join(" ") }.join("\n")
      final_rhyme << "\n" if index > 2
      final_rhyme << "#{last}"
      final_rhyme << "."
      final_rhyme << "\n\n" if index < pieces.length
    end

    final_rhyme + "\n"
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
