def factors(number)
  dividend = number
  divisors = []
  if dividend <= 0
    puts "Please enter a number greater than zero."
    return
  end

  # LS Answer uses a while loop
  loop do
    # number % dividend == 0 tests if the dividend is a divisor
    # a dividend is a divisor only if it divides into number without a remainder
    # LS answer states that number % dividend == 0 allows you to test if result of division is a remainder
    # but I'm pretty sure I am correct as well
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
    break if dividend == 0
  end
  # this line explicitly returns the divisors array
  # without it, the method returns nil
  divisors
  end

puts factors(0)
puts factors(-2)
p factors(12)
