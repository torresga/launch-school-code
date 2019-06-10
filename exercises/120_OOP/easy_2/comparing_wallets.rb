# Comparing Wallets
# Consider the following broken code:

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
   amount <=> other_wallet.amount
  end

#   We can create a getter method to create an amount getter method. Protected means that we can call the getter method with an explicit receiver, yet the method will not be accessible outside of the Wallet class.
  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end
# Modify this code so it works. Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.
