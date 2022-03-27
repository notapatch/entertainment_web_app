class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show]
  before_action :authorized?, only: %i[show]

  def show; end

  private

  def set_customer
    @customer = User.find(params[:id])
  end

  def authorized?
    return if Customers::CustomersShowPolicy.new(current_user, @customer).show?

    head :unauthorized
  end
end
