# After Midnight (Part 1)
# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# Input: A positive or negative Integer representing minutes
# Output: A string representing the time in 24 hr format (hh:mm)

# Mental model of problem: Return a string containing a timestamp in hour and day format consisting of integer minutes away from 00:00.

# If number is negative, subtract minutes from 00:00. If number is positive, add numbers to 00:00.

# We are working time we are dealing with multiples of 60 since 60 minutes equals 1 hour. So if we have an input over 60, we divide input by 60 to get hours, and remainder is minutes. And then we add and subtract as needed.

# If hours and minutes are positive, we add hours and minutes + 00:00
# If hours and minutes are negative, we subtract hour and minutes from 23:60 since there are 24 hours in a day and 00:00 is the same as 23:60.

# If hours are more than 24, then we divide by 24. We always want hours to be less than 24 and minutes to be less than 60.

# Examples:

# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# Disregard Daylight Savings and Standard Time and other complications.

# Algorithm
# Determine whether input is negative or positive.
# If input is negative?
#   Set start_hour to 23
#   Set start_minutes to 59
# Else
#   Set start_hour to 0
#   Set start_minutes to 0

# If input is greater than or equal to 60
#   Divide input by 60
#   Assign quotient to hours, remainder to minutes
# Else
#   Add input to minutes

# If hours is greater or equal to 24
#    Reassign remainder (modulus) to hours

# If input is negative
#   Return a new string: start_hour - hours : start_minutes - minutes
# Else
#   Return a new string: start_hour + hours : start_minutes + minutes

# Code
def is_negative?(number)
  (number / -1) > 0
end

MIN_PER_HOUR = 60
HOURS_PER_DAY = 24

def time_of_day(minutes)
  negative_input = is_negative?(minutes)
  start_hour = negative_input ? 23 : 0
  start_minutes = negative_input ? 60 : 0

  base_mins = minutes.abs
  if base_mins >= MIN_PER_HOUR
    hours, mins = base_mins.divmod(MIN_PER_HOUR)
  else
    hours = 0
    mins = base_mins
  end

  if hours >= HOURS_PER_DAY
    hours = hours.divmod(HOURS_PER_DAY).last
  end

  if negative_input
    "#{sprintf("%02d:%02d", (start_hour - hours), (start_minutes - mins))}"
  else
    "#{sprintf("%02d:%02d", (start_hour + hours), (start_minutes + mins))}"
  end

end
puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

# Further Exploration
# How would you approach this problem if you were allowed to use ruby's Date and Time classes? Suppose you also needed to consider the day of week? (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday; in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)
 # To use ruby's date and time classes I would create a new date object, sunday 00:00 current month current year. and then maybe we can subtract or add minutes from that time to create a new date?

def time_of_day(minutes)
#   Get current year
#   Get current month
#   Get next sunday
#   Create new date object for current year, month, sunday, at 00:00

  year = Time.now.year
  month = 2 #Let's make this feb since we are currently in february
  day = 24

  time = Time.new(year, month, day)

#  When you add or subtract from a time object, the time is interpreted in seconds. so we would have to multiply minutes by 60.
#   return new time
  time + (minutes * 60)
end

puts time_of_day(0) #== "00:00"
puts time_of_day(-3) #== "23:57"
puts time_of_day(35) #== "00:35"
puts time_of_day(-1437) #== "00:03"
puts time_of_day(3000) #== "02:00"
puts time_of_day(800) #== "13:20"
puts time_of_day(-4231) #== "01:29"
