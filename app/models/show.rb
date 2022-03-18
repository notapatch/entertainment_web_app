class Show < ApplicationRecord
  enum :category, { tv_series: 0, movie: 1 }, prefix: true
  enum :rating, { e: 0, u: 1, pg: 2, "18": 3 }, prefix: true

  has_one_attached :regular_image do |attachable|
    attachable.variant :large, resize_to_limit: [560, 348]
    attachable.variant :medium, resize_to_limit: [440, 280]
    attachable.variant :small, resize_to_limit: [323, 220]
  end

  has_one_attached :trending_image do |attachable|
    attachable.variant :large, resize_to_limit: [940, 460]
    attachable.variant :small, resize_to_limit: [480, 280]
  end
end
