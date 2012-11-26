require 'spec_helper'

=begin

The primary goals of this excercise are to get your comfortable with the Ruby language and some of its characteristics. 

If you have any questions please do not hesitate to email me at jp@developwithpassion.com,or give me a call at (503)213-3507.
 
Develop With Passion

=end

describe MovieLibrary do
  context 'general movie functionality' do
    let(:movie_collection){[]}
    let(:sut){MovieLibrary.new(movie_collection)}

    context 'when counting the number of movies' do
      before(:each) do
        movie_collection.push(Movie.new(), Movie.new())
      end

      it 'should return the number of movies' do
        sut.all_movies.count.should == 2
      end
    end

    context 'when asked for all of the movies' do
      let(:first_movie){Movie.new}
      let(:second_movie){Movie.new}

      before(:each) do
        movie_collection.push(first_movie)
        movie_collection.push(second_movie)
      end

      it 'should return a set containing each movie in the library' do
        sut.all_movies.should == [first_movie,second_movie]
      end
    end
    context 'when adding a movie to the library' do
      let(:movie){Movie.new}

      before(:each) do
        sut.add(movie)
      end

      it 'should store it in the movie collection' do
        movie_collection.include?(movie).should be_true
      end
    end

    context 'when adding an existing movie in the collection again' do
      let(:movie){Movie.new}
      before (:each) do
        movie_collection.push(movie)
      end
      before (:each) do
        sut.add(movie)
      end
      
      it 'should not add it to the movie collection' do
        movie_collection.count.should == 1
      end
    end
    context 'when attempting to add a different copy of the same movie' do
      let(:another_copy_of_speed_racer){Movie.new('Speed Racer')}
      let(:speed_racer){Movie.new('Speed Racer')}

      before (:each) do
        movie_collection.push(speed_racer)
      end
      before (:each) do
        sut.add(another_copy_of_speed_racer)
      end
      
      it 'should store only 1 copy in the collection' do
        movie_collection.count.should == 1
      end
    end
    
    context 'searching and sorting' do

      let(:indiana_jones_and_the_temple_of_doom) do
        Movie.new("Indiana Jones And The Temple Of Doom",
        Time.new(1982, 1, 1),
        Genre.action,
        ProductionStudio.Universal,
        10)
      end

      let (:cars) do
       Movie.new("Cars",
        Time.new(2004, 1, 1),
        Genre.kids,
        ProductionStudio.Pixar,
        10)
      end

      let(:the_ring) do
        Movie.new("The Ring",
        Time.new(2005, 1, 1),
        Genre.horror,
        ProductionStudio.MGM,
        7)
      end

      let(:shrek) do
        Movie.new("Shrek",
        Time.new(2006, 5, 10),
        Genre.kids,
        ProductionStudio.Dreamworks,
        10)
      end

      let(:a_bugs_life) do
        Movie.new("A Bugs Life",
        Time.new(2000, 6, 20),
        Genre.kids,
        ProductionStudio.Pixar,
        10)
      end

      let(:theres_something_about_mary) do
        Movie.new("There's Something About Mary",
        Time.new(2007, 1, 1),
        Genre.comedy,
        ProductionStudio.MGM,
        5)
      end

      let(:pirates_of_the_carribean) do
        Movie.new("Pirates of the Carribean",
        Time.new(2003, 1, 1),
        Genre.action,
        ProductionStudio.Disney,
        10)
      end

      let(:original_movies){[indiana_jones_and_the_temple_of_doom, cars,a_bugs_life,theres_something_about_mary,pirates_of_the_carribean,the_ring,shrek]}

      before :each do
        original_movies.each do |movie|
          movie_collection.push(movie)
        end
      end

      context 'when searching for movies' do
          it 'should be able to find all movies published by pixar' do
            results = sut.all_movies_published_by_pixar
            results.should == [ cars, a_bugs_life ]
          end

          it 'should be able to find all movies published by pixar or disney' do
            results = sut.all_movies_published_by_pixar_or_disney
            [ a_bugs_life, pirates_of_the_carribean, cars ].each { |item| results.include?(item).should be_true }
          end

          it 'should be able to find all movies not published by pixar' do
            results = sut.all_movies_not_published_by_pixar()

            [cars,a_bugs_life].each do |item|
              results.include?(item).should be_false
            end
          end

          it 'should be able to find all movies published after a certain year' do
            results = sut.all_movies_published_after(2004)
            [the_ring, shrek, theres_something_about_mary ].each { |item| results.include?(item).should be_true }
          end

          #it 'should be able to find all movies published between a certain range of years' do

            #results = sut.all_movies_published_between_years(1982, 2003)

            #results.should == [ indiana_jones_and_the_temple_of_doom, a_bugs_life, pirates_of_the_carribean ]

          #end

          #it 'should be able to find all kid movies' do
            #results = sut.all_kid_movies()

            #results.should == [ a_bugs_life, shrek, cars ]
          #end

          #it 'should be able to find all action movies' do

            #results = sut.all_action_movies()

            #results.should  == [ indiana_jones_and_the_temple_of_doom, pirates_of_the_carribean ]
          #end
      end
      context 'when searching for movies' do
        #it 'should be able to sort all movies by title descending' do
          #results = sut.sort_all_movies_by_title_descending()

          #results.should == [theres_something_about_mary, the_ring, shrek, pirates_of_the_carribean, indiana_jones_and_the_temple_of_doom, cars, a_bugs_life]
        #end

        #it 'should be able to sort all movies by title ascending' do
          #results = sut.sort_all_movies_by_title_ascending()

          #results.should == [ a_bugs_life, cars, indiana_jones_and_the_temple_of_doom, pirates_of_the_carribean, shrek, the_ring, theres_something_about_mary ]
        #end
        #it 'should be able to sort all movies by date published descending' do
          #results = sut.sort_all_movies_by_date_published_descending()

          #results.should == [ theres_something_about_mary, shrek, the_ring, cars, pirates_of_the_carribean, a_bugs_life, indiana_jones_and_the_temple_of_doom ]
        #end

        #it 'should be able to sort all movies by date published ascending' do
          #results = sut.sort_all_movies_by_date_published_ascending()

          #results.should == [ indiana_jones_and_the_temple_of_doom, a_bugs_life, pirates_of_the_carribean, cars, the_ring, shrek, theres_something_about_mary ]
        #end

        #it 'should be able to sort all movies by studio rating and year published' do
          #results = sut.sort_all_movies_by_movie_studio_and_year_published()

          #results.should == [ the_ring, theres_something_about_mary, a_bugs_life, cars, shrek, indiana_jones_and_the_temple_of_doom, pirates_of_the_carribean ]
        #end
      end
    end
  end
end
