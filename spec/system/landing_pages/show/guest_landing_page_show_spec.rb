require "rails_helper"

RSpec.describe "Guest@LandingPage#show", type: :system do
  it "Opens landing page" do
    visit landing_page_path

    expect(page).to have_selector "h1", text: "Entertainment"
  end

  it "defaults to landing page" do
    visit root_path

    expect(page).to have_selector "h1", text: "Entertainment"
  end

  it "can login as customer" do
    create(:customer, :avatared, email: "customer1@example.com")
    visit landing_page_path

    click_on "Sign In"

    fill_in "Email", with: "customer1@example.com"
    fill_in "Password", with: "password"

    click_on "Login to your account"

    expect(page).to have_selector "h2", text: "Trending"
    expect(page).to have_selector "h2", text: "Recommended for you"
  end

  it "cannot login without credentials", js: true do
    create(:customer, email: "customer1@example.com")
    visit landing_page_path

    click_on "Sign In"

    fill_in "Email", with: "customer1@example.com"

    click_on "Login to your account"

    expect(page).to have_selector "p", text: "Invalid Email or password."
  end
end
