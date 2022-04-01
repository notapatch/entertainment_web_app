module Customers
  class BaseController < ApplicationController
    before_action :authenticate_customer!
    layout "customer"
  end
end
