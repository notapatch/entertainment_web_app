FactoryBot.define do
  factory :customer do
    sequence :email do |n|
      "customer#{n}@example.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end
end
