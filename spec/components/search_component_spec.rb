# frozen_string_literal: true

require "rails_helper"

RSpec.describe SearchComponent, type: :component do
  it "renders placeholder" do
    expect(
      render_inline(described_class.new(placeholder: "bookmarkers")).to_html
    ).to include(
      `placeholder="bookmarkers"`
    )
  end
end
