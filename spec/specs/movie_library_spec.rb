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
      before(:each) do
        movie_collection.push(movie)
      end
      before(:each) do
        sut.add(movie)
      end

      it 'should not add it to the movie collection' do
        movie_collection.count.should == 1
      end
    end
    context 'when attempting to add a different copy of the same movie' do
      let(:another_copy_of_speed_racer){Movie.new(:title => 'Speed Racer')}
      let(:speed_racer){Movie.new(:title => 'Speed Racer')}

      before(:each) do
        movie_collection.push(speed_racer)
      end
      before(:each) do
        sut.add(another_copy_of_speed_racer)
      end

      it 'should store only 1 copy in the collection' do
        movie_collection.count.should == 1
      end
    end

    context 'searching and sorting' do

      let(:indiana_jones_and_the_temple_of_doom) do
        Movie.new :title => "Indiana Jones And The Temple Of Doom", :date_published => Time.new(1982, 1, 1), :genre => Genre.action, :production_studio => ProductionStudio.Universal, :rating => 10
      end

      let(:cars) do
        Movie.new :title => "Cars", :date_published => Time.new(2004, 1, 1), :genre => Genre.kids, :production_studio => ProductionStudio.Pixar, :rating => 10
      end

      let(:the_ring) do
        Movie.new :title => "The Ring", :date_published => Time.new(2005, 1, 1), :genre => Genre.horror, :production_studio => ProductionStudio.MGM, :rating => 7
      end

      let(:shrek) do
        Movie.new :title => "Shrek", :date_published => Time.new(2006, 5, 10), :genre => Genre.kids, :production_studio => ProductionStudio.Dreamworks, :rating => 10
      end

      let(:a_bugs_life) do
        Movie.new :title => "A Bugs Life", :date_published => Time.new(2000, 6, 20), :genre => Genre.kids, :production_studio => ProductionStudio.Pixar, :rating => 10
      end

      let(:theres_something_about_mary) do
        Movie.new :title => "There's Something About Mary", :date_published => Time.new(2007, 1, 1), :genre => Genre.comedy, :production_studio => ProductionStudio.MGM, :rating => 5
      end

      let(:pirates_of_the_carribean) do
        Movie.new :title => "Pirates of the Carribean", :date_published => Time.new(2003, 1, 1), :genre => Genre.action, :production_studio => ProductionStudio.Disney, :rating => 10
      end

      let(:original_movies){[indiana_jones_and_the_temple_of_doom, cars,a_bugs_life,theres_something_about_mary,pirates_of_the_carribean,the_ring,shrek]}

      before :each do
        original_movies.each do |movie|
          movie_collection.push(movie)
        end
      end

      context 'when searching for movies' do
        it 'should be able to invoke a behaviour on an item' do
          item = Object.new

          def item.do_something
            42
          end
          item.send(:do_something).should == 42
        end


          it 'should be able to find all movies published by pixar' do
            criteria = Where.item(:studio).equal_to(ProductionStudio.Pixar)

            results = sut.all_items_matching criteria

            results.should == [ cars, a_bugs_life ]
          end

          it 'should be able to find all movies published by pixar or disney' do
           criteria = Where.item(:studio).equal_to_any(ProductionStudio.Pixar,ProductionStudio.Disney)
           results = sut.all_items_matching criteria

           results.should contain(cars,a_bugs_life,pirates_of_the_carribean)
          end

          it 'should be able to find all movies not published by pixar' do
            criteria = Where.item(:studio).not.equal_to(ProductionStudio.Pixar)

            results = sut.all_items_matching criteria

            [cars,a_bugs_life].each do |item|
              results.include?(item).should be_false
            end
          end

          it 'should be able to find all movies published after a certain year' do
            criteria = Where.item(:release_date).not.greater_than(Time.new(2004,01,01))
            results = sut.all_items_matching criteria

            results.should_not contain(the_ring, shrek, theres_something_about_mary)
          end

          it 'should be able to find all movies published between a certain range of years' do
            criteria = Where.item(:release_date).between(Time.new(1982,01,01), Time.new(2003,12,01))
            results = sut.all_items_matching criteria

            results.should contain(indiana_jones_and_the_temple_of_doom, a_bugs_life, pirates_of_the_carribean)
          end

          it 'should be able to find all kid movies' do
            criteria = Where.item(:genre).equal_to(Genre.kids)
            results = sut.all_items_matching criteria

            results.should contain(a_bugs_life, shrek, cars)
          end

          it 'should be able to find all action movies' do
            criteria = Where.item(:genre).equal_to(Genre.action)
            results = sut.all_items_matching criteria

            results.should contain(indiana_jones_and_the_temple_of_doom, pirates_of_the_carribean)
          end
      end
      context 'when searching for movies' do
        it 'should be able to sort all movies by title descending' do
          sort = Sort.by_descending(:title)

          results = sut.sort_all_items_by sort

          results.should contain_in_order(theres_something_about_mary, the_ring, shrek, pirates_of_the_carribean, indiana_jones_and_the_temple_of_doom, cars, a_bugs_life)
        end

        it 'should be able to sort all movies by title ascending' do
          sort = Sort.by(:title)
          results = sut.sort_all_items_by sort
          results.should contain_in_order(a_bugs_life, cars, indiana_jones_and_the_temple_of_doom, pirates_of_the_carribean, shrek, the_ring, theres_something_about_mary)
        end

        it 'should be able to sort all movies by date published descending' do
          sort = Sort.by(:release_date)
          results = sut.sort_all_items_by sort
          results.should contain_in_order(theres_something_about_mary, shrek, the_ring, cars, pirates_of_the_carribean, a_bugs_life, indiana_jones_and_the_temple_of_doom)
        end

        it 'should be able to sort all movies by date published ascending' do
          sort = Sort.by(:release_date)
          results = sut.sort_all_items_by sort
          results.should contain_in_order(indiana_jones_and_the_temple_of_doom, a_bugs_life, pirates_of_the_carribean, cars, the_ring, shrek, theres_something_about_mary)
        end

        it 'should be able to sort all movies by studio rating and year published' do
          sort = Sort.by(:studio, ProductionStudio.MGM,
                        ProductionStudio.Disney,
                        ProductionStudio.Pixar,
                        ProductionStudio.Dreamworks,
                        ProductionStudio.Paramount).then_by(:release_date)
          results = sut.sort_all_items_by sort
          results.should == [indiana_jones_and_the_temple_of_doom, a_bugs_life, pirates_of_the_carribean, cars, shrek, the_ring, theres_something_about_mary]
        end

      end
    end
  end
end
