# frozen_string_literal: true

require "rails_helper"

RSpec.describe BookmarkComponent, type: :component do
  it "renders if bookmarked" do
    html = render_inline(described_class.new(bookmarked: true)).to_html

    expect(html).to include("Bookmarked")
  end

  it "renders if not bookmarked" do
    html = render_inline(described_class.new(bookmarked: false)).to_html

    expect(html).to include("No Bookmark")
  end
end
