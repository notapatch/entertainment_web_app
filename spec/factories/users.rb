FactoryBot.define do
  factory :user do
    password { "password" }
    password_confirmation { "password" }

    trait :avatared do
      after(:build) do |user|
        user.avatar.attach(io: File.open(Rails.root.join("_starter/assets/user_images/image-anne.jpg")),
                           filename: "image-anne.jpg", content_type: "image/jpeg")
      end
    end

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
