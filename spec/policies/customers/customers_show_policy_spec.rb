require "rails_helper"

RSpec.describe Customers::CustomersShowPolicy do
  describe "#show?" do
    context "when a user is allowed" do
      it "allows when user is the same as customer" do
        user = customer = create(:customer)

        expect(described_class.new(user, customer)).to be_show
      end

      it "allows when user is staff" do
        user = create(:staff)
        customer = create(:customer)

        expect(described_class.new(user, customer)).to be_show
      end
    end

    context "when a user is not allowed" do
      it "not allowed when user is nil" do
        user = nil
        customer = create(:customer)

        expect(described_class.new(user, customer)).not_to be_show
      end

      it "not allowed when user is different from customer" do
        user = create(:customer)
        customer = create(:customer)

        expect(described_class.new(user, customer)).not_to be_show
      end
    end
  end
end
