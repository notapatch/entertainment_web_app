require "rails_helper"

RSpec.describe "Customer@Customers::Homes#show" do
  it "can visit customer home page" do
    sign_in create(:customer)
    visit customer_root_path

    expect(page).to have_selector "h2", text: "Trending"
    expect(page).to have_selector "h2", text: "Recommended for you"
  end
end
