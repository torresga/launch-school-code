# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# Need to loop over hash and inner arrays.

hsh.each do |k, words|
  words.each do |word|
    word.each_char do |char|
      puts char if %w(a e i o u).include?(char)
    end
  end
end
