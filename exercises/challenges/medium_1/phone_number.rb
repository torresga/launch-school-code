# Phone Number
#
# Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.
#
# The rules are as follows:
#
#     If the phone number is less than 10 digits assume that it is bad number
#     If the phone number is 10 digits assume that it is good
#     If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
#     If the phone number is 11 digits and the first number is not 1, then it is a bad number
#     If the phone number is more than 11 digits assume that it is a bad number

# class PhoneNumber
#   - initialize
#   - Input: a number as a string
#   - sets an instance variable to number
#   - number
#     - Input: none
#     - Output: 00000000 depending on the number's size
#     - Removes all formatting
      # - return either changed number or 00000000 as a string depending on the following rules:
        # - if phone number is less than 10 digits or phone number is 11 digits and the first number is not 1 or phone number is more than 11 digits
        #     return `0000000000`
        # - if phone number is 10 digits
        #     return number
        # - if phone number is 11 digits and first number is 1
        #   return last 10 digits
#   - area code
#     - Input: none
#     - Output: first three numbers as a string
#     - Returns first three numbers as a string
#   - to_s
#     - Input: none
#     - Output: A string formatted to the valid number
#     - Adds formatting

class PhoneNumber
  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number.gsub(/[^a-z0-9]/i, '')
  end

  def number
    if phone_number.length == 10 && !phone_number.match?(/[a-z]/i)
      phone_number
    elsif phone_number.length == 11 && phone_number[0] == '1'
      phone_number[1..-1]
    else
      '0000000000'
    end
  end

  def area_code
    phone_number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..-1]}"
  end
end
