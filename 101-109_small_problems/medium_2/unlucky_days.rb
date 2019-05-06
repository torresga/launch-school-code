# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# Input: One year greater than 1752.
# Output: The number of friday the 13ths in a year

# Examples:

# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2

# Data Structures

# Represent time as a time class
# Can represent the months 1 to 12 as a range
# Can select the months that have the 13th on a friday

# Algorithm

# Represent the months 1 to 12 as a range
# Loop through the months
# Select month if month has the 13th on a friday
# Return count

# Code
def friday_13th(year)
  (1..12).select do |month|
    Time.local(year, month, 13).friday?
  end.length
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further Exploration
# An interesting variation on this problem is to count the number months that have five Fridays. This one is harder than it sounds since you must account for leap years.
