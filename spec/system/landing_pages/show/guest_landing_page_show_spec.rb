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
    create(:customer, email: "customer1@example.com")
    visit landing_page_path

    click_on "Sign In"

    fill_in "Email", with: "customer1@example.com"
    fill_in "Password", with: "password"

    click_on "Login to your account"

    expect(page).to have_selector "h2", text: "Trending"
  end

  it "can login as staff" do
    create(:staff, email: "staff1@example.com")
    visit landing_page_path

    click_on "Sign In"

    fill_in "Email", with: "staff1@example.com"
    fill_in "Password", with: "password"

    click_on "Login to your account"

    expect(page).to have_selector "h2", text: "All Shows"
  end

  it "errors without credentials" do
    create(:staff, email: "staff1@example.com")
    visit landing_page_path

    click_on "Sign In"

    fill_in "Email", with: "staff1@example.com"

    click_on "Login to your account"

    expect(page).to have_selector "p", text: "Invalid Email or password."
  end
end
