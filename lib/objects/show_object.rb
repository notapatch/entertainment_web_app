class ShowObject
  def initialize(data)
    @data = data
  end

  def bookmarked
    @data["isBookmarked"]
  end

  def category
    enumerize(@data["category"])
  end

  def title
    @data["title"]
  end

  def rating
    enumerize(@data["rating"])
  end

  def regular_image_path
    @data.dig("thumbnail", "regular", "large")
  end

  def trending
    @data["isTrending"]
  end

  def trending_image_path
    @data.dig("thumbnail", "trending", "large")
  end

  def year
    @data["year"]
  end

  private

  def enumerize(category)
    category.parameterize(separator: "_").to_sym
  end
end
