# PEDAC
# Goal: Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# Identify Expected Input or output
# Make requirements explicit
# Identify rules
# Mental models of problem

# Input: An integer greater than 1
# Output: a string
#

# I think it's safe to say that the suffixes are as follows:
# ending with 1 : st
# ending with 2 : nd
# ending with 3: rd
# ending with 4 through 0: th
# exceptions are 11 through 13th

# centuries start in years ending in 1. yet they are one more than the beginning two numbers.

# years 1 to 99 is a special case. that is the first century

#
# Create examples/test cases

# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'
#
# Data Structures
# Input is represented by integer and output is represented by a string.
# Input can be broken into an array to check individual numbers

# Algorithm
# Get Input
# Create century variable
# Split year into array
# If array.length is < than 3
# year_ending is 0
# century is 1
# remove ones and tens places from year and add to new variable year_ending
# Create a new variable century_string
# If year_ending is between 01 and 99
# Increase century by 1
# Add century to century_string
# If century_string ends with 11, 12, or 13, append th
# Else get ending from dictionary and append it to century_string

# Code

ORDINALS = {
  "1": "st",
  "2": "nd",
  "3": "rd",
  "4": "th",
  "5": "th",
  "6": "th",
  "7": "th",
  "8": "th",
  "9": "th",
  "0": "th" }

def get_century(year)
  year_digits = year.digits.reverse
  year_ending = []

  if year_digits.length >= 3
    year_ending = year_digits.pop(2).join
    century = year_digits.join
  else
    # special case when year less than 99
    year_ending = 0
    century = "1"
  end

  if year_ending.to_i >= 1 && year_ending.to_i <= 99
    century.next!
  end

  century
end

def century(year)
  century = get_century(year)
  century_string = ""
  century_string << century

  if %w(11 12 13).include?(century_string)
    century_string << "th"
  else
    key = century_string[-1].to_sym
    century_string << ORDINALS[key]
  end

  century_string
end

puts century(2000) # == '20th'
puts century(2001) # == '21st'
puts century(1965) # == '20th'
puts century(256) # == '3rd'
puts century(101) # == '2nd'
puts century(40) # == '1st'
puts century(5) # == '1st'
puts century(10103) # == '102nd'
puts century(1052) # == '11th'
puts century(1127) #== '12th'
puts century(11201) #== '113th'
