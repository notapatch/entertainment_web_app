# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShowComponent, type: :component do
  it "renders expected content" do
    show = create(:show, :regular_image,
                  title: "Power of the Dog",
                  category: "movie",
                  rating: "18",
                  year: 1999)

    html = render_inline(described_class.new(show: show)).to_html
    expect(html).to include("1999")
    expect(html).to include("Movie")
    expect(html).to include("18+")
    expect(html).to include("Power of the Dog")
  end
end
