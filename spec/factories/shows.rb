FactoryBot.define do
  factory :show do
    title { FFaker::Movie.title }
    year { 2020 }
    category { 1 }
    rating { 1 }
    bookmarked { false }
    trending { false }
  end
end
