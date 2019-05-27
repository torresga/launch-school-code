# Question 1
#
# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."
#
# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"
#
# Who is right, Ben or Alyssa, and why?

# They are both right (kinda). On line 13, Ben is not accessing the instance variable @balance - he is accessing the getter method balance defined on line 6 by attr_reader.

# But you can refer to the instance variable @balance on line 13 as well and it will work. But it's not good practice to refer to instance variables by their names, it's better to use the getter and setter methods.

account = BankAccount.new(500)
p account.positive_balance?
