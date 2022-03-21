require "rails_helper"
require "objects/show_object"

RSpec.describe ShowObject, type: :objects do
  describe "#title" do
    it "returns title" do
      data = { "title" => "hello" }

      expect(described_class.new(data).title).to eq "hello"
    end

    it "returns title with separators unchanged" do
      data = { "title" => "hello you" }

      expect(described_class.new(data).title).to eq "hello you"
    end
  end

  it "returns year" do
    data = { "year" => 2020 }

    expect(described_class.new(data).year).to eq 2020
  end

  describe "#category" do
    it "returns symbolised category" do
      data = { "category" => "Movie" }

      expect(described_class.new(data).category).to eq :movie
    end

    it "returns category with separators underscored" do
      data = { "category" => "TV Series" }

      expect(described_class.new(data).category).to eq :tv_series
    end
  end

  describe "#rating" do
    it "returns rating" do
      data = { "rating" => "E" }

      expect(described_class.new(data).rating).to eq :e
    end

    it "returns rating without special characters" do
      data = { "rating" => "E+" }

      expect(described_class.new(data).rating).to eq :e
    end

    it "returns digits" do
      data = { "rating" => "18" }

      expect(described_class.new(data).rating).to eq :"18"
    end
  end

  describe "bookmarked" do
    it "returns expected bookmarked when true" do
      data = { "isBookmarked" => true }

      expect(described_class.new(data).bookmarked).to be true
    end

    it "returns expected bookmarked when false" do
      data = { "isBookmarked" => false }

      expect(described_class.new(data).bookmarked).to be false
    end
  end

  describe "trending" do
    it "returns expected trending when true" do
      data = { "isTrending" => true }

      expect(described_class.new(data).trending).to be true
    end

    it "returns expected trending when false" do
      data = { "isTrending" => false }

      expect(described_class.new(data).trending).to be false
    end
  end

  describe "regular_image_path" do
    it "returns expected path" do
      data = { "thumbnail" => { "trending" =>
       {
         "large" => "./app/assets/images/thumbnails/the-diary/regular/large.jpg"
       } } }

      expect(described_class.new(data).regular_image_path.to_s)
        .to eq "./app/assets/images/thumbnails/the-diary/regular/large.jpg"
    end
  end
end
