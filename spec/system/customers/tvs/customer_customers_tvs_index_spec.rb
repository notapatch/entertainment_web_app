require "rails_helper"

RSpec.describe "Customer@Customer::Tvs#index" do
  it "can visit customer tvs page" do
    customer = create(:customer, :avatared)
    sign_in customer
    visit customer_tvs_path(customer)

    expect(page).to have_selector("h2", text: "TV Series")
  end
end
