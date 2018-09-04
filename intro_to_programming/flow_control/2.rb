def all_caps(word)
  if word.length > 10
    new_caps_word = word.upcase
    new_caps_word
  else
    word
  end
end

puts all_caps("hello world")

puts all_caps("trip")
