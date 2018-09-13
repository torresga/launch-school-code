def get_quote(person)
  # if person == 'Yoda'
  #   return 'Do. Or do not. There is no try.'
  # end
  #
  # if person == 'Confucius'
  #   return 'I hear and I forget. I see and I remember. I do and I understand.'
  # end
  #
  # if person == 'Einstein'
  #   return 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  # end
# this method returns nil because there are no return statements and there's no expression at the end of the method
# if an if statement doesn't have an else, it will return nil
end

puts 'Confucius says:'

puts '"' + get_quote('Einstein') + '"'
