require 'stringio'
require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(10)
    @transaction = Transaction.new(5)
  end

  # We now have the foundation of our CashRegister test class set up. Let's start testing! We'll start with the CashRegister#accept_money method. Write a test for the #accept_money method.
  def test_accept_money
    assert_equal(10, @register.total_money)

    @transaction.amount_paid = 3
    @register.accept_money(@transaction)
    assert_equal(13, @register.total_money)
  end

  # Write a test for the method, CashRegister#change.
  def test_change
    change = @register.change(@transaction)
    assert_equal(@transaction.amount_paid, @transaction.item_cost + change)
  end

  # Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.
  def test_give_receipt
    # transaction item cost is 5
    assert_output("You've paid $5.\n") { @register.give_receipt(@transaction) }
  end
end
