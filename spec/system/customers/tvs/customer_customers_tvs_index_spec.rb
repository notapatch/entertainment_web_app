require "rails_helper"

RSpec.describe "Customer@Customer::Tvs#index" do
  it "can visit customer tvs page" do
    customer = create(:customer, :avatared)
    create(:show, title: "Power of the Dog", category: "movie")
    create(:show, title: "Julia", category: "tv_series")
    sign_in customer
    visit customer_tvs_path(customer)

    expect(page).to have_selector("h2", text: "TV Series")
    expect(page).to have_selector("h3", text: "Julia")
  end
end
