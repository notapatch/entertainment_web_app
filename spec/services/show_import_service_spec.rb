require "rails_helper"

RSpec.describe ShowImportService, type: :service do
  it "imports valid object" do
    show_object = ShowObject.new(json_data("show_valid.json"))
    result = described_class.new.import(show_object)

    expect(result).to be_imported
    expect(result.show).to be_truthy

    expect(result.show.bookmarked).to be_truthy
    expect(result.show).to be_category_movie
    expect(result.show).to be_rating_pg
    expect(result.show.regular_image).to be_attached
    expect(result.show.title).to eq "Beyond Earth"
    expect(result.show.trending_image).to be_attached
    expect(result.show.year).to eq 2019
  end

  it "imports valid object with bookmarked false" do
    show_object = ShowObject.new(json_data("show_not_bookmarked.json"))
    result = described_class.new.import(show_object)

    expect(result).to be_imported
    expect(result.show.errors.count).to eq 0
    expect(result.show.bookmarked).to be_falsey
  end

  it "imports valid object without trending image" do
    show_object = ShowObject.new(json_data("show_no_trending_image.json"))
    result = described_class.new.import(show_object)

    expect(result).to be_imported
    expect(result.show.errors.count).to eq 0
    expect(result.show.trending_image).not_to be_attached
  end

  it "errors on invalid object" do
    show_object = ShowObject.new(json_data("show_invalid.json"))
    result = described_class.new.import(show_object)

    expect(result).not_to be_imported
    expect(result.show.errors.count).to eq 1
    expect(result.show.errors.full_messages.join(", ")).to eq "Title can't be blank"
  end

  def json_data(filename)
    filename = Rails.root.join("spec/fixtures/shows/#{filename}")
    JSON.load_file(filename)
  end
end
