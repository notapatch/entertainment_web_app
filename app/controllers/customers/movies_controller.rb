module Customers
  class MoviesController < BaseController
    def index
      @movies = Show
                .with_attached_regular_image
                .where(category: "movie")
    end
  end
end
