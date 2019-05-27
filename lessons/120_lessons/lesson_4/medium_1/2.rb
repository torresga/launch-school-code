# Question 2
#
# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :product_name
  # Need an attr_accessor to create both getter and setter methods for :quantity
  attr_accessor :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    # Ruby referring to local variable quantity, not instance variable quantity or setter method
    # Can use self.quantity here to call setter method
    self.quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.
#
# Can you spot the mistake and how to address it?

# Inside update_quantity, quantity is considered a local variable. Thus, update_quantity will fail to update the count of quantity, regardless if updated_count is positive or negative. When we look at our getter and setter methods we realize that quantity does not have a setter method to update the quantity. So we define both getter and setter methods for quantity. Then we call self.quantity to update quantity using the setter method.


# ...Or you can just have attr_reader :quantity and then reassign the value of @quantity in update_quantity

entry = InvoiceEntry.new("flip flops", 10)
p entry
entry.update_quantity(15)
p entry
