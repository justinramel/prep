
class MovieLibrary
  def initialize(movies)
    @movies = movies
  end

  def add(movie)
    @movies.push(movie) unless @movies.include? movie
  end

  def all_movies
    @movies
  end

  def all_movies_published_by_pixar
    all_movies.find_all do |item|
      item.studio == ProductionStudio.Pixar
    end
  end
end
