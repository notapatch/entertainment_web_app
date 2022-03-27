require "rails_helper"

RSpec.describe "Hacker@Customers#show", type: :system do
  it "cannot enter as customer" do
    customer = create(:customer, email: "customer1@example.com")
    visit customer_path(customer)

    expect(page.status_code).to eq(401)
  end
end
