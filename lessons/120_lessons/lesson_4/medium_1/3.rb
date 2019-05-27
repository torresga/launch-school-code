# Question 3
#
# In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  private

  attr_writer :quantity
end

entry = InvoiceEntry.new("flip flops", 10)
p entry
entry.update_quantity(25)
p entry

# Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.
#
# Is there anything wrong with fixing it this way?

# I thought the recommended way was to use attr_accessor and use the setter method?

# Only drawback I would see is that it might be a security issue to have a publicly assessible setter method. We could make our setter method private and then call it inside update_quantity.
