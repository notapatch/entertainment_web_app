require "rails_helper"

RSpec.describe User, type: :model do
  describe "roles" do
    it "can be a customer" do
      customer = build(:customer)

      expect(customer).to be_valid
      expect(customer.email).to match(/customer\d@example.com/)
      expect(customer).to be_customer_role
    end

    it "can be a staff" do
      staff = build(:staff)

      expect(staff).to be_valid
      expect(staff.email).to match(/staff\d@example.com/)
      expect(staff).to be_staff_role
    end
  end
end
