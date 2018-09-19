words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams = {}

def sort_word(word)
  word.split("").sort.join
end

keys = words.uniq {|w| sort_word(w)}

keys.each {|key| anagrams[key] = []}

anagrams.each_key do |key|
  words.each do |word|
    anagrams[key].push(word) if sort_word(key) == sort_word(word)
  end
end

anagrams.each do |key, value|
  puts "#{key}: #{value}"
end
