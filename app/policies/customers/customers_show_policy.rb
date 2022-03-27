module Customers
  class CustomersShowPolicy
    attr_reader :user, :customer

    def initialize(user, customer)
      @user = user
      @customer = customer
    end

    def show?
      return true if @user&.staff_role?

      @user == @customer
    end
  end
end
