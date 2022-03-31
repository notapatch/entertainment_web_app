require "rails_helper"

RSpec.describe "Customer@Customer::Bookmarks#index" do
  it "can visit customer bookmarks page" do
    customer = create(:customer, :avatared)
    sign_in customer
    visit customer_bookmarks_path(customer)

    expect(page).to have_selector("h2", text: "Bookmarked Movies")
    expect(page).to have_selector("h2", text: "Bookmarked TV Series")
  end
end
