require "rails_helper"

RSpec.describe Show, type: :model do
  describe "#validates" do
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:year) }
  end
end
