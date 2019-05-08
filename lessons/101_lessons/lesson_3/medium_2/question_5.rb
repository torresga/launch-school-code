def color_valid(color)
  # LS answer: they just wanted you to remove the if statement
  # since color == "blue" || color == "green" would evaluate to either true or false (DUH)
  %w(blue green).include?(color)
end
