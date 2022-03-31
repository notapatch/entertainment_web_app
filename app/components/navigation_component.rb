# frozen_string_literal: true

class NavigationComponent < ViewComponent::Base
  def initialize(current_customer:)
    super
    @current_customer = current_customer
  end
end
