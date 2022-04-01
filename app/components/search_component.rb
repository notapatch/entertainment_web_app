# frozen_string_literal: true

class SearchComponent < ViewComponent::Base
  def initialize(placeholder:)
    super
    @placeholder = placeholder
  end
end
