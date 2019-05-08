# Stack Machine Interpretation
# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

# You should initialize the register to 0.

# A stack is Last in first out.
# Stack is an array with #push and #pop.

# So it sounds like my initial theory is correct - last item in stack is removed, sent to register (in ruby can be another variable). performs operation in register.

# Input: A string of One or more integer values and commands
# Output: The result of an operation displayed to the screen (depending on the input commands)
# Mental Model: Given one or more integers and string commands, write a method that modifies an array and a variable representing a memory register.

# Data Structures

# Input can be represented as a string and broken up internally as an array of both string and integer elements
# Register can be represented as a variable
# Output can be represented as an integer

# Algorithm

# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# Create a register variable and initialize it to 0
# Create a stack array
# Split input into an array of values
# Loop through the input array
#   Case current value is an integer
#     Reassign register to current value
#   Case current value equals PUSH
#     Push current value to stack array
#   Case current value equals ADD
#     Assign value of register + stack.pop to register
#   Case current value equals SUB
#     Assign value of register - stack.pop to register
#   Case current value equals MULT
#     Assign value of register * stack.pop to register
#   Case current value equals DIV
#     Assign value of register / stack.pop to register
#   Case current value equals MOD
#     Assign value of register % stack.pop to register
#   Case current value equals POP
#     Assign to register the value of stack.pop
#   Case current value equals PRINT
#     Output register

# Code

def minilang(commands)
  register = 0
  stack = []
  commands = commands.split

  commands.each do |command|
    case
      when command.to_i.to_s == command
        register = command.to_i
      when command == "PUSH"
        stack.push(register)
      when command == "ADD"
        register += stack.pop
      when command == "SUB"
        register -= stack.pop
      when command == "MULT"
        register *= stack.pop
      when command == "DIV"
        register /= stack.pop
      when command == "MOD"
        register %= stack.pop
      when command == "POP"
        register = stack.pop
      when command == "PRINT"
        puts register
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# # 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

minilang('5 PUSH POP PRINT')
# # 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

minilang('-3 PUSH 5 SUB PRINT')
# # 8

 minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

# Further Exploration
# Try writing a minilang program to evaluate and print the result of this expression:
#
# (3 + (4 * 5) - 7) / (5 % 3)
# The answer should be 8. This is trickier than it sounds! Note that we aren't asking you to modify the #minilang method; we want you to write a Minilang program that can be passed to #minilang and evaluated.
#
# Add some error handling to your method. In particular, have the method detect empty stack conditions, and invalid tokens in the program, and report those. Ideally, the method should return an error message if an error occurs, and nil if the program runs successfully.
