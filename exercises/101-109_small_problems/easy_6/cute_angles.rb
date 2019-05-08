# Cute angles
# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# Input: A floating point number representing an angle.
# Output: A string representing an angle in degrees, minutes, and seconds.
# Mental model of problem: Given a floating point number, convert that number to degrees, minutes, and seconds. Return the degrees, minutes, and seconds as a string.

# Part before fraction is number of degrees. Fraction * 60 is number of minutes. Remainder of fraction * 60 is number of seconds.

# Examples:

# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:

 DEGREE = "\xC2\xB0"

# Data structures
# Input is a floating point number.
# We can represent degrees, minutes, and seconds as an integer.
# Output is a string.

# Algorithm
# Get input number
# Assign to Degrees number without fraction
# Assign to Minutes the fractional part of number * 60
# Assign to Seconds the fractional part of minutes * 60

# Create a new string with the format of degrees, minutes, and seconds
# Return string

# Code
def dms(angle)
#   How does LS round them?
#   Also we have to make sure that minutes and seconds esp are either *60 if < than 60, otherwise 0.
  if angle < 0
    degrees = 360 + angle
  elsif angle >= 0 && angle < 360
    degrees = angle.floor
    else
    degrees = angle.floor - 360
  end

  minutes = ((angle - angle.floor) * 60)
  seconds = ((minutes - minutes.floor) * 60)

  minutes = minutes.round < 60 ? minutes.round : 0
  seconds = seconds.round < 60 ? seconds.round : 0

  # It looks like only .99999 are rounded to the next whole number. otherwise fractional part is dropped.
  sprintf("%0d#{DEGREE}%02d'%02d\"", degrees, minutes, seconds)
end

puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
puts dms(361)
puts dms(500)
puts dms(-30)
puts dms(-180)
puts dms(-76.73)

# Further Exploration
# Our solution works with any non-negative number of degrees, including values outside the range 0 to 360. Does yours?

# While our solution works with the expanded range of non-negative numbers, it fails with negative numbers. For instance, dms(-76.73) returns -77°16'12", which is incorrect. Update our solution so that it works with negative values as well as non-negative values.
