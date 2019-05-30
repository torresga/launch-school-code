# Fix the Program - Flight Data
#
# Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

# Do we need get and set access to the instance variable @database_handle? We can remove it, or create the appropriate getter or setter methods as needed.
