# frozen_string_literal: true

class ShowComponent < ViewComponent::Base
  def initialize(show:, size: nil)
    super
    @show = show
    @size = size
  end
end
