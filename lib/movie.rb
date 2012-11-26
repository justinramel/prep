
class Movie
  attr_reader :title, :studio, :release_date

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

  def to_s
    "#{title}, #{studio}, #{release_date}"
  end
end
