
class Movie
  attr_reader :title, :studio, :release_date, :genre, :rating

  def initialize(title = 'unknown', release_date = nil, genre = nil, studio = nil, rating = 0)
    @title = title
    @release_date = release_date
    @genre = genre
    @studio = studio
    @rating = rating
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
