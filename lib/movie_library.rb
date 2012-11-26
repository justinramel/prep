
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
    find_by(lambda { |item| item.studio == ProductionStudio.Pixar } )
  end

  def all_movies_published_by_pixar_or_disney
    find_by(lambda { |item| item.studio == ProductionStudio.Pixar || item.studio == ProductionStudio.Disney } )
  end

  private 
  def find_by(predicate) 
    all_movies.find_all do |item|
      predicate.call(item)
    end
  end
end
