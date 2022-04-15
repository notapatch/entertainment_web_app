require "rails_helper"

RSpec.describe EnumHelper, type: :helper do
  describe "#category" do
    [
      [:tv_series, "TV Series"],
      [:movie, "Movie"]
    ].each do |key, value|
      it "returns the expected value for #{key}" do
        expect(human_enum_name(model_name: :show,
                               enum_name: :category,
                               enum_key: key)).to eq(value)
      end
    end
  end

  describe "#rating" do
    [
      [:e, "E"],
      [:u, "U"],
      [:pg, "PG"],
      [:"18", "18+"]
    ].each do |key, value|
      it "returns the expected value for #{key}" do
        expect(human_enum_name(model_name: :show,
                               enum_name: :rating,
                               enum_key: key)).to eq(value)
      end
    end
  end
end
