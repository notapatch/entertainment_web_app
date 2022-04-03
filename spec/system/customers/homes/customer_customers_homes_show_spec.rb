require "rails_helper"

RSpec.describe "Customer@Customers::Homes#show" do
  it "can visit customer home page" do
    customer = create(:customer, :avatared)
    create(:show, title: "Power of the Dog", trending: true)
    create(:show, title: "About a boy", trending: false)
    sign_in customer
    visit customer_homes_path(customer)

    within "#trending" do
      expect(page).to have_selector "h2", text: "Trending"
      expect(page).to have_selector("h3", text: "Power of the Dog")
    end

    within "#recommended" do
      expect(page).to have_selector "h2", text: "Recommended for you"
      expect(page).to have_selector("h3", text: "About a boy")
    end
  end
end
