# Spin Me Around In Circles
# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

# It's going to be a different object. split returns a new array, which is a different object and has a different object_id from str.

# Since each returns the original collection it was called upon, each word element has to be mutated.

# Then join is called on the resulting array with returns another object, which is a different object from str.

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

str = 'hello world'
puts str.object_id # 47435609148580
puts spin_me(str).object_id # 47435609148360

def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end
end

arr = ['hello', 'world']
puts arr.object_id # 47264354160220
puts spin_me(arr).object_id # 47264354160220
