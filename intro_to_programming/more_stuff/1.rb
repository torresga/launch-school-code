def check_for_lab(word)
  if word.downcase.match("lab")
    puts "#{word}"
  else
    puts "#{word} does not contain 'lab'"
  end
end

check_for_lab("laboratory")
check_for_lab('experiment')
check_for_lab("Pans Labyrinth")
check_for_lab("elaborate")
check_for_lab("polar bear")
