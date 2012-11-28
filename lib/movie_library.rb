require 'enumerables'

class MovieLibrary
  include Enumerables

  attr_reader :all

  def initialize(movies)
    @all = movies
  end


  def add(movie)
    all.push(movie) unless all.include? movie
  end

  def all_movies;all;end

  def sort_all_movies_by_title_ascending
    all_movies.sort do |x,y|
      x.title <=> y.title
    end
  end

  def sort_all_movies_by_title_descending
    sort_all_movies_by_title_ascending.reverse
  end

  def sort_all_movies_by_date_published_ascending
    all_movies.sort do |x,y|
      x.release_date <=> y.release_date
    end
  end

  def sort_all_movies_by_date_published_descending
    sort_all_movies_by_date_published_ascending.reverse
  end

  def sort_all_movies_by_movie_studio_and_year_published
    all_movies.sort
  end

end
