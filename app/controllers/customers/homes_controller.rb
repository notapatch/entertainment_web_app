module Customers
  class HomesController < Customers::BaseController
    def show
      @trending = Show.where(trending: true)
      @shows = Show.all
    end
  end
end
