require "rails_helper"

RSpec.describe "Customer@Customer::Movies#index" do
  it "can visit customer movies page" do
    customer = create(:customer)
    sign_in customer
    visit customer_movies_path(customer)

    expect(page).to have_selector("h2", text: "Movies")
  end
end
