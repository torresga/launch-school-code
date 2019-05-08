def car(new_car)
  make = make(new_car)
  model = model(new_car)
  # returns an array
  [make, model]
end

def make(new_car)
  new_car.split(" ")[0]
end

def model(new_car)
  # is nil because there's no value at new_car.split(" ")[2]
  new_car.split(" ")[1]
end

# each variable is assigned a value in the array - called multiple assignment
make, model = car("Ford Mustang")
make == "Ford"
puts make.class
puts model.class
model.start_with?("M")
