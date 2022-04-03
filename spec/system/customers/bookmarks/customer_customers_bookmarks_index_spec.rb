require "rails_helper"

RSpec.describe "Customer@Customer::Bookmarks#index" do
  it "can visit customer bookmarks page" do
    customer = create(:customer, :avatared)
    create(:show, title: "Power of the Dog", category: "movie")
    create(:show, title: "Julia", category: "tv_series")
    sign_in customer
    visit customer_bookmarks_path(customer)

    within "#bookmarked-movies" do
      expect(page).to have_selector("h2", text: "Bookmarked Movies")
      expect(page).to have_selector("h3", text: "Power of the Dog")
    end

    within "#bookmarked-tv-series" do
      expect(page).to have_selector("h2", text: "Bookmarked TV Series")
      expect(page).to have_selector("h3", text: "Julia")
    end
  end
end
