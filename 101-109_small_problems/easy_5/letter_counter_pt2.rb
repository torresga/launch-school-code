# Letter Counter (Part 2)
# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

# One way we can modify the previous exercise is by using String#gsub to remove non-alphanumeric characters from the string before we split it and loop over it.

# Examples

# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

# Code
def word_sizes(str)
  sizes = {}

  return sizes if str == ""

  str.gsub(/[^a-z\s]/i, "").split(" ").each do |word|
    key = word.length
    if sizes.has_key?(key)
      sizes[key] += 1
    else
      sizes[key] = 1
    end
  end
  sizes
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# Further Exploration
# If you haven't encountered String#delete before, take a few minutes to read up on it, and its companion String#count (you need to read about #count to get all of the information you need to understand #delete).
