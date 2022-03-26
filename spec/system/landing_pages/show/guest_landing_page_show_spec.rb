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

  it "can login" do
    create(:user, email: "user1@example.com")
    visit landing_page_path

    click_on "Sign In"

    fill_in "Email", with: "user1@example.com"
    fill_in "Password", with: "password"

    click_on "Login to your account"
  end
end
