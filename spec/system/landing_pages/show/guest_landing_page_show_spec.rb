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
end
