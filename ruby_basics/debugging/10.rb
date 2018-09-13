player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

character_classes = {
  warrior: { strength: 20 },
  thief: { dexterity: 20 },
  scout: { stamina: 20 },
  mage: { charisma: 20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

# input is a string and not a symbol
# Also, merge doesn't mutate the caller - it returns a new hash. Either assign the result of player.merge to new variable or use !
player.merge!(character_classes[input.to_sym])

puts 'Your character stats:'
puts player
