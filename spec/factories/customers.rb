FactoryBot.define do
  factory :customer do
    sequence :email do |n|
      "customer#{n}@example.com"
    end
    password { "password" }
    password_confirmation { "password" }

    trait :avatared do
      after(:build) do |customer|
        customer.avatar.attach(io: File.open(Rails.root.join("_starter/assets/user_images/image-anne.jpg")),
                               filename: "image-anne.jpg", content_type: "image/jpeg")
      end
    end
  end
end
