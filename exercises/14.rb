contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
contact_data_labels = [:email, :address, :phone]

contacts.each_value do |v|
  contact_data_labels.each do |label|
    v[label] = contact_data.shift
  end
end

p contacts
