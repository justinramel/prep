
class Movie
  attr_reader :title, :studio

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
end
