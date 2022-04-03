module Customers
  class BookmarksController < BaseController
    def index
      @bookmarked_movies = Show.where(category: "movie").limit(5)
      @bookmarked_tv_shows = Show.where(category: "tv_series").limit(5)
    end
  end
end
