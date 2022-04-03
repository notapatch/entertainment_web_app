require "rails_helper"

RSpec.describe "Customer@Customer::Movies#index" do
  it "can visit customer movies page" do
    customer = create(:customer, :avatared)
    create(:show, title: "Power of the Dog", category: "movie")
    create(:show, title: "Julia", category: "tv_series")
    sign_in customer
    visit customer_movies_path(customer)

    expect(page).to have_selector("h2", text: "Movies")
    expect(page).to have_selector("h3", text: "Power of the Dog")
  end
end
