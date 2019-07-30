# Luhn Algorithm
#
# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.
#
# The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:
#
#     Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.
#     For any digits that thus become 10 or more, subtract 9 from the result.
#         1111 becomes 2121.
#         8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
#     Add all these digits together.
#         1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6.
#         8763 becomes 7733, and 7+7+3+3 is 20.
#
# If the total (the checksum) ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).
#
# Write a program that, given a number
#
#     Can check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid.
#     Can return the checksum, or the remainder from using the Luhn method.
#     Can add a check digit to make the number valid per the Luhn formula and return the original number plus that digit. This should give "2323 2005 7766 3554" in response to "2323 2005 7766 355".
#
# About Checksums:
#
# A checksum has to do with error-detection. There are a number of different ways in which a checksum could be calculated.
#
# When transmitting data, you might also send along a checksum that says how many bytes of data are being sent. That means that when the data arrives on the other side, you can count the bytes and compare it to the checksum. If these are different, then the data has been garbled in transmission.
#
# In the Luhn problem the final digit acts as a sanity check for all the prior digits. Running those prior digits through a particular algorithm should give you that final digit.
#
# It doesn't actually tell you if it's a real credit card number, only that it's a plausible one. It's the same thing with the bytes that get transmitted -- you could have the right number of bytes and still have a garbled message. So checksums are a simple sanity-check, not a real in-depth verification of the authenticity of some data. It's often a cheap first pass, and can be used to quickly discard obviously invalid things.

# Create checksum: the algorithm above
# Input: A number
# Output: A number representing the remainder

# Rules:
# - doesn't look like we need to account for non-integer data
#
# Data Structure:
# can use an array to break up digits. then we can use with_index to double any element with an index divisible by 2, and sum the result
#
# Algorithm:

# 1. Split number into array.
# 2. Create a new array
# 3. Reverse Loop through array
# 4. If index+1 is divisble by 2
#     Double the element
#     If doubled element is greater than 10, subtract 9
#    Otherwise return element
# 5. Sum up all elements

# Return if number is valid: Checks whether the remainder ends in zero
# Input: A number
# Output: Boolean representing whether the remainder ends in zero

# algorithm
# 1. Perform checksum on number
# 2. Test whether last number equals zero
#
# Add a check digit: Subtracts number that ends in zero from checksum and adds it to original number
# Input: A number
# Output: Original number + remainder

# algorithm
# 1. Perform checksum on number
# 2. Find a number larger than checksum that ends in zero
# 3. Subtract checksum from that number
# 4. Add difference to original number

class Luhn
  def initialize(number)
    @number = number
  end

  def checksum
    addends.sum
  end

  def valid?
    a_checksum = checksum.digits.reverse
    a_checksum.last == 0
  end

  def addends
    addends = []

    @number.digits.reverse.reverse_each.with_index do |elem, index|
      if (index+1).even?
        doubled_element = elem * 2
        if doubled_element >= 10
          addends << (doubled_element - 9)
        else
          addends << doubled_element
        end
      else
        addends << elem
      end
    end

    addends.reverse
  end

  # To produce validation digit we can simply append "0" to source sequence and calculate Luhn checksum again. If last digit of the obtained checksum is zero then the validation digit is also zero, otherwise validation digit can be obtained by subtracting last checksum digit from 10.
  def self.create(number)
    new_number = (number.to_s + "0").to_i
    checksum = self.new(new_number).checksum
    digit = checksum.digits.reverse.last == 0 ? 0 : 10 - checksum.digits.reverse.last

    (number.to_s + digit.to_s).to_i
  end
end

# p Luhn.new(232320057766355).addends
# p Luhn.new(2323200577663550).checksum

p Luhn.new(7992739871).checksum
