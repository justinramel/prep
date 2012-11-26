require 'rspec'

require 'movie_library'
require 'movie'
require 'genre'
require 'production_studio'
require 'is_published_by'

module RSpec
  Matchers.define :contain do |*expected_items|
    match do|results|
      expected_items.each do |item|
        results.include?(item).should be_true
      end
    end
  end

  Matchers.define :contain_in_order do |*expected_items|
    match do|results|
      expected_items.should == results
    end
  end
end
