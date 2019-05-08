# After Midnight (Part 2)
# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# Two methods

# before_midnight
# # Input: a string representing a time.
# # Output: An integer representing the minutes before midnight in the range 0...1439

# after_midnight
# # Input: a string representing a time
# # Output: An integer representing the minutes after midnight in the range 0..1439

# What does the value 1439 stand for?

# number of minutes in an hour = 60
# number of hours in a day = 24
# number of minutes in a day = 24 * 60 = 1440, so 0..1439 makes sense if we are starting from 0

# Examples:

# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0
# Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; it makes the problem more interesting.

# Disregard Daylight Savings and Standard Time and other irregularities.

# Algorithm
# After-midnight
# Cut string in half
# Assign first half to hours variable
# Assign second_half to minutes

# Reassign minutes to minutes + hours * 60
# If minutes is not in the range of 0..1439)
#   return 0
# Else
#   return minutes

# Before-midnight
# Cut string in half
# Assign first half to hours variable
# Assign second_half to minutes

# Reassign minutes to minutes + hours * 60
# If minutes is not in the range of 0..1439)
#   return 0
# Else
#   return minutes_in_a_day - minutes

# Code

MINUTES_IN_AN_HOUR = 60
HOURS_IN_A_DAY = 24
MINUTES_IN_A_DAY = MINUTES_IN_AN_HOUR * HOURS_IN_A_DAY

def before_midnight(time)
  hours, minutes = time.split(":")

  minutes = minutes.to_i + (hours.to_i * MINUTES_IN_AN_HOUR)

  if (minutes <= 0) || (minutes > 1439)
    return 0
  else
    MINUTES_IN_A_DAY - minutes
  end
end

def after_midnight(time)
  hours, minutes = time.split(":")

  minutes = minutes.to_i + (hours.to_i * MINUTES_IN_AN_HOUR)

  if (minutes <= 0) || (minutes > 1439)
    return 0
  else
    minutes
  end
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# Further Exploration
# How would these methods change if you were allowed to use the Date and Time classes?

# before_midnight(time_string) and after_midnight(time_string)
# Input is time string
# Ouputs are integers

# after midnight - minutes
# before midnight - minutes in a day - minutes

def after_midnight(time_string)
  # Create Date object with time string
  year = Time.now.year
  month = 2 #Let's make this feb since we are currently in february
  day = 24
  hours, minutes = time_string.split(":").map(&:to_i)

  time = Time.new(year, month, day, hours, minutes)

  (time.hour * MINUTES_IN_AN_HOUR) + time.min
end

def before_midnight(time_string)
  minutes = MINUTES_IN_A_DAY - after_midnight(time_string)
  minutes < MINUTES_IN_A_DAY ? minutes : 0
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
