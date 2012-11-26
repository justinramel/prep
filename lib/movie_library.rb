require 'enumerables'

class MovieLibrary
  include Enumerables

  def initialize(movies)
    @all = movies
  end

  def all
    @all
  end

  def add(movie)
    all.push(movie) unless all.include? movie
  end

  def all_movies
    all
  end

  def all_movies_published_by_pixar_or_disney
    all_items_matching{ |item| item.studio == ProductionStudio.Pixar || item.studio == ProductionStudio.Disney } 
  end

  def all_movies_not_published_by_pixar
    all_items_matching{ |item| item.studio != ProductionStudio.Pixar } 
  end

  def all_movies_published_after(year)
    all_items_matching{ |item| item.release_date.year >= year } 
  end

  def all_movies_published_between_years(start_year, end_year)
    all_items_matching{ |item| item.release_date.year >= start_year || item.release_date.year <= end_year } 
  end

  def all_kid_movies
    all_items_matching{ |item| item.genre == Genre.kids }
  end

  def all_action_movies
    all_items_matching{|item| item.genre == Genre.action }
  end

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
