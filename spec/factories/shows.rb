FactoryBot.define do
  factory :show do
    title { FFaker::Movie.title }
    year { 2020 }
    category { 1 }
    rating { 1 }
    bookmarked { false }
    trending { false }

    trait :regular_image do
      after(:build) do |show|
        show.regular_image
            .attach(io: File.open(Rails.root.join("spec/fixtures/thumbnails/regular/small.jpg")),
                    filename: "small.jpg", content_type: "image/jpeg")
      end
    end
  end
end
