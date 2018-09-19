def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine
    # this should be if sunshine == 'true'
    # is always displayed because sunshine is a string and not a boolean, and strings are evaluated as true.
    # only nil and false are evaluated as false
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

predict_weather
