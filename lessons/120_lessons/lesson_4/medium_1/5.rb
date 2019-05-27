# Question 5
#
# You are given the following class that has been implemented:

class KrispyKreme
  # also can create attr_reader here to create getter method for filling_type and glazing
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  # Looks like we need to override the to_s method
  def to_s
    # if filling_type
      # we output filling_type
    # else we output Plain
    # if glazing
    #   we output "with glazing"
    # else we output nothing

    flavor = filling_type ? "#{filling_type}" : "Plain"
    glaze = glazing ? " with #{glazing}" : ""

    flavor + glaze
  end
end

# And the following specification of expected behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
#   => "Custard with icing"
#
# Write additional code for KrispyKreme such that the puts statements will work as specified above.
