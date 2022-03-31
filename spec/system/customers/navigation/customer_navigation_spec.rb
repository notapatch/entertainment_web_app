require "rails_helper"

RSpec.describe "Customer@customers_navigation", type: :system do
  it "can navigate through customer pages" do
    customer = create(:customer, :avatared)
    sign_in customer

    visit customer_root_path(customer)

    click_link "Navigate to Movies."

    expect(page).to have_selector "div", id: "movies"
    expect(page).to have_selector "h2", text: "Movies"

    click_link "Navigate to TV Series."

    expect(page).to have_selector "div", id: "tvs"
    expect(page).to have_selector "h2", text: "TV Series"

    click_link "Navigate to Bookmark."

    expect(page).to have_selector "div", id: "bookmarks"
    expect(page).to have_selector "h2", text: "Bookmarked Movies"
    expect(page).to have_selector "h2", text: "Bookmarked TV Series"

    click_link "Navigate to Home."

    expect(page).to have_selector "div", id: "home"
    expect(page).to have_selector "h2", text: "Trending"
    expect(page).to have_selector "h2", text: "Recommended for you"

    click_link "Navigate to Movies."
  end
end
