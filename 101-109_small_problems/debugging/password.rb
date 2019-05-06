# Password
# The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password. However, the program throws an error. What is the problem and how can you fix it?

# Once you get the program to run without error, does it behave as expected? Verify that you are able to log in with your new password.

password = nil

def set_password
 puts 'What would you like your password to be?'
 new_password = gets.chomp
 new_password
end

def verify_password(password)
 puts '** Login **'
 print 'Password: '
 input = gets.chomp

 if input == password
   puts 'Welcome to the inside!'
 else
   puts 'Authentication failed.'
 end
end

if !password
 password = set_password
end

verify_password(password)

# On line 6, the local variable 'password' is initialized with the value 'nil'. Since methods set a new scope, the local variable 'password' is not accessible inside either 'set_password' or 'verify_password'.

# set_password needs to return new password
# we need to set password to return value of set_password on line 27
# then we need to pass in password as an argument of the verify_password method on line 30
