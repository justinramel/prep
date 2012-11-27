
class Movie
  attr_reader :title, :release_date, :genre, :rating, :studio

  def initialize(initial_details = Hash.new(nil))
    @title = initial_details[:title]
    @release_date = initial_details[:date_published]
    @genre = initial_details[:genre]
    @studio = initial_details[:production_studio]
    @rating = initial_details[:rating]
  end

  def ==(other)
    @title == other.title
  end

  def <=>(y)
    return -1 if studio < y.studio
    return 1 if studio > y.studio

    return -1 if release_date.year < y.release_date.year
    return 1 if release_date.year > y.release_date.year

    0
  end

  def to_s
    "#{title}"
  end

  def self.is_published_by_pixar
    IsPublishedBy.new(ProductionStudio.Pixar)
  end

  def self.is_published_by_pixar_or_disney
    IsPublishedBy.new(ProductionStudio.Pixar).or (IsPublishedBy.new(ProductionStudio.Disney))
  end
end
