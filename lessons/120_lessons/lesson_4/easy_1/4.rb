# Question 4
#
# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# We can create a new instance of the AngryCat class by calling the 'new' method on the AngryCat class:

cat = AngryCat.new
p cat
cat.hiss
