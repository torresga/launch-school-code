# Staggered Caps (Part 2)
# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

# Input: A string
# Output: A string
# Mental model: Given a string, create a new string with staggered capitalization.

# Example:

# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Data structure

# Input and output are strings.

# Algorithm

# Return array

# Code
def staggered_case(string, start_case="uppercase")
  result = ''
  need_upper = start_case.include?("up") ? true : false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end

    if char.match(/[^a-z]/i)
      need_upper = !!need_upper
    else
      need_upper = !need_upper
    end
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further Exploration
# Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state. That is, you want a method that can perform the same actions that this method does, or operates like the previous version.

# Hint: Use a keyword argument.
