# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# =>[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Input: Hash of vegetables and fruits
# Output: Array of capitalized colors of fruits, and uppercase sizes of the vegetables

# We don't need to deal with keys, only values, since in values there's a type key-value pair
# We are selecting colors of fruits
# We are selecting sizes of vegetables
#
# Create new array for colors_and_sizes
# For each key-value pair in hash
#   if type == fruit
#     append to colors_and_sizes array the colors array
#     capitalize each element in colors array
#   if type == vegetable
#     append to colors_and_sizes array the size string
      # make size string uppercase

# With each and extra hash
colors_and_sizes = []

hsh.each do |_, v|
  if v[:type] == "fruit"
    colors = []
    v[:colors].each do |color|
      colors << color.capitalize
    end
    colors_and_sizes << colors
  elsif v[:type] == "vegetable"
    colors_and_sizes << v[:size].upcase
  end
end


# Or using map
hsh.map do |_, v|
  if v[:type] == "fruit"
    v[:colors].map do |color|
      color.capitalize
    end
  elsif v[:type] == "vegetable"
    v[:size].upcase
  end
end
