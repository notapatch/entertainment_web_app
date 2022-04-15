# frozen_string_literal: true

class BookmarkComponent < ViewComponent::Base
  def initialize(bookmarked:)
    super
    @bookmarked = bookmarked
  end
end
