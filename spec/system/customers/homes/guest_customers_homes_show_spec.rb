require "rails_helper"

RSpec.describe "Guest@Customers::Homes#show" do
  it "roots to the landing page" do
    visit customer_root_path

    expect(page).to have_selector "h1", text: "Entertainment"
  end

  it "redirects customers area guests to login" do
    customer = create(:customer)
    visit customer_homes_path(customer)

    expect(page).to have_selector "h2", text: "Login"
  end
end
