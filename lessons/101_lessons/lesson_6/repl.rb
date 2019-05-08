loop do
  print ">> "
  command = gets
  p eval command
  break if command == "exit"
end
