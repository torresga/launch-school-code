words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

sorted_words = words.map { |x| x.split("").sort.join }.uniq

words_hash = Hash.new

sorted_words.each do |word|
  words_hash[word] = words.select { |w| w.split("").sort.join == word }
end

words_hash.values.each do |v|
  p v
end
