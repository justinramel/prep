module Kernel
  def where(field)
    Where.new(field)
  end
end

class Where
  attr_reader :field

  def initialize(field)
    @field = field
  end

  def not
    @negate = true
    self
  end

  def create_matcher_using(match_strategy = NeverMatch.new, &block)
    strategy = block_given? ? BlockMatch.new(&block) : match_strategy
    SymbolicMatch.new(field,strategy)
  end

  def equal_to_any(*values)
    create_matcher_using {|item| values.include? item}
  end

  def equal_to(value)
    equal_to_any value
  end

  def greater_than(value)
    create_matcher_using {|item| item > value}
  end

  def between(min, max)
    create_matcher_using {|item| (min..max) === item}
  end

  def self.item(field)
    new(field)
  end

end
