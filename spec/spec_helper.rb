require 'rspec'

Dir.glob('lib/**/*.rb').each do |f|
 $:.unshift File.dirname(f)
 require File.basename(f, '.rb')
end

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
