module Customers
  class MoviesController < BaseController
    def index
      @movies = Show.where(category: "movie")
    end
  end
end
