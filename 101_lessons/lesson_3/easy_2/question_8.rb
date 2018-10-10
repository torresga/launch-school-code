advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!((0..38))
puts advice
# LS Answer
# advice.slice!(0, advice.index('house'))

# When you use String#slice, the original object is not modified.
