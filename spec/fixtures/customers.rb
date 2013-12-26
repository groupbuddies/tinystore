require 'entities/customer'

def customer
  @_customer ||= Customer.new(id: 10)
end
