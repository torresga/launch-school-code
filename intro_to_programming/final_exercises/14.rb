# For one:
# contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
# contacts = {"Joe Smith" => {}}
#
# contact_tags = [:email, :address, :phone]
#
# contacts.each do |k, v|
#   contact_tags.each do |field|
#     contacts[k][field] = contact_data.shift
#   end
# end

# For many
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contact_tags = [:email, :address, :phone]

contacts.each do |k, v|
  person = contact_data.shift
  contact_tags.each do |field|
    v[field] = person.shift
  end
end

puts contacts
