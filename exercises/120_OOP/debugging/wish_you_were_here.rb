# Wish You Were Here

# On lines 37 and 38 of our code, we can see that grace and ada are located at the same coordinates. So why does line 39 output false? Fix the code to produce the expected output.

class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other_obj)
    latitude == other_obj.latitude && longitude == other_obj.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
# Since each object inside of location is a GeoLocation object, we have the == defined by BasicObject. Thus, == tests whether the two objects are the same object, not if they have the same value. We have to override the == method inside of GeoLocation to test whether latitude and other object's latitudes are the same and whether longitude and other object's longitudes are the same.
puts ada.location == grace.location # expected: true
                                    # actual: false
