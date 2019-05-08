# Convert a Signed Number to a String!
  # In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

  # Write a method that takes an integer, and converts it to a string representation.

  # You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

  # Input: An integer
  # Output: String representation of integer
  # Mental model of problem: Method that takes an integer and returns the string representation of that integer.

  # If number is positive, add + sign. If number is negative, add -.

  # Examples

  # signed_integer_to_string(4321) == '+4321'
  # signed_integer_to_string(-123) == '-123'
  # signed_integer_to_string(0) == '0'

  # Algorithm
  # Get integer input
  # Removing sign if integer is negative
  # Turn integer into string
  # Look at number
  #   If number is 0
  #     Don't add a sign
  #   Else if number is negative
  #     Prepend a "-" to string
  #   Else
  #     Add + to string

  # Code

  NUM_VALUES = {
    1 => "1",
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    0 => "0"
  }

  def integer_to_string(number)
    int_string = ""
    integers = number.digits.reverse

    integers.each do |int|
      int_string << NUM_VALUES[int]
    end

    int_string
  end

  def is_negative?(number)
    (number / -1) > 0
  end

  def signed_integer_to_string(number)
    without_sign = is_negative?(number) ? number * -1 : number

    numerical_str = integer_to_string(without_sign)

    if numerical_str == "0"
      return numerical_str
    elsif is_negative?(number)
      numerical_str.prepend("-")
    else
      numerical_str.prepend("+")
    end
    numerical_str
  end

  # puts signed_integer_to_string(4321) == '+4321'
  # puts signed_integer_to_string(-123) == '-123'
  # puts signed_integer_to_string(0) == '0'

  # Further Exploration
  # Refactor our solution to reduce the 3 integer_to_string calls to just one.
  DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

  def integer_to_string(number)
    result = ''
    loop do
      number, remainder = number.divmod(10)
      result.prepend(DIGITS[remainder])
      break if number == 0
    end
    result
  end

  def signed_integer_to_string(number)
    positive_number = (number / -1) > 0 ? number * -1 : number
    sign = case number <=> 0
      when -1 then "-"
      when +1 then "+"
      else         ""
      end
      "#{sign}#{integer_to_string(positive_number)}"
  end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
