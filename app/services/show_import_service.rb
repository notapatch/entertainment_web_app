require "objects/show_object"

class ShowImportService
  def import(show_object)
    show = Show.new(title: show_object.title,
                    year: show_object.year,
                    category: show_object.category,
                    rating: show_object.rating,
                    bookmarked: show_object.bookmarked,
                    trending: show_object.trending)
    show.save
    return Result.new(imported: show.valid?, show: show) if show.invalid?

    attach(show.regular_image, show_object.regular_image_path)
    attach(show.trending_image, show_object.trending_image_path) if show_object.trending_image_path

    Result.new(imported: show.valid?, show: show)
  end

  class Result
    attr_reader :show

    def initialize(imported:, show:)
      @imported = imported
      @show = show
    end

    def imported?
      @imported
    end
  end

  private

  def attach(image, path)
    image.attach(io: File.open(Rails.root.join(path)),
                 filename: "large.jpg",
                 content_type: "image/jpeg")
  end
end
