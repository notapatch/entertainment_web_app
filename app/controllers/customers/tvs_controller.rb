module Customers
  class TvsController < BaseController
    def index
      @tv_series = Show.where(category: "tv_series")
    end
  end
end
