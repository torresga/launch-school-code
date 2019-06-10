# Fix the Program - Books (Part 1)
# Complete this program so that it produces the expected output:

class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)
# Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What are the differences between attr_reader, attr_writer, and attr_accessor? Why did we use attr_reader instead of one of the other two? Would it be okay to use one of the others? Why or why not?

# attr_reader : creates getter methods
# attr_writer : creates setter methods
# attr_accessor : creates both getter and setter methods
# Used attr_reader because this code only requires getter methods.
# Typically only create the methods you will use in your code, to reduce access, or encapsulate the code that isn't needed.

# Instead of attr_reader, suppose you had added the following methods to this class:

# def title
#   @title
# end

# def author
#   @author
# end

# Would this change the behavior of the class in any way? If so, how? If not, why not? Can you think of any advantages of this code?

# Would not change the behavior of the class as written. Advantages to this code would be if you needed to add special functionality to the getter methods, for example, in one of the lessons, another class was called when we called the getter methods. We would not be able to create that functionality without writing our own getter methods.
