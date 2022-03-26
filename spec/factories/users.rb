FactoryBot.define do
  factory :user do
    password { "password" }
    password_confirmation { "password" }

    factory :customer do
      sequence(:email) { |n| "customer#{n}@example.com" }
      role { "customer" }
    end

    factory :staff do
      sequence(:email) { |n| "staff#{n}@example.com" }
      role { "staff" }
    end
  end
end
