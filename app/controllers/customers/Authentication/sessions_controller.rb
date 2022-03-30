# frozen_string_literal: true

module Customers
  module Authentication
    class SessionsController < Devise::SessionsController
      # GET /resource/sign_in
      def new
        super do |_|
          @customers = Customer.all.limit(5)
        end
      end
    end
  end
end
