def countdown(number)
  if number > 0
    puts number
    countdown(number - 1)
  else
    puts "BLAST OFF!"
  end
end

countdown(10)
countdown(20)
