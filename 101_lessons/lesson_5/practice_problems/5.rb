# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

# Nested hash - hashes inside a hash
# Select the only keys that have a value of gender="male"

men = munsters.select do |k, v|
  v["gender"] == "male"
end

# Collect the ages- can we use reduce?
ages = men.values.map { |i| i["age"] }
puts ages.reduce { |sum, age| sum + age }
