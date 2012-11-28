module Kernel
  def where(field)
    Where.new(field)
  end
end

class NegateMatch
  include Matcher
  def initialize(original)
    @original = original
  end
  def matches(item)
    !@original.matches(item)
  end
end
module NegationBehaviour
  def create_matcher(*args)
    NegateMatch.new(super)
  end
end
class Where
  attr_reader :field

  def initialize(field)
    @field = field
  end

  def create_matcher(match_strategy = NeverMatch.new, &block)
    strategy = block_given? ? BlockMatch.new(&block) : match_strategy

    SymbolicMatch.new(field,strategy)
  end

  def equal_to_any(*values)
    create_matcher {|item| values.include? item}
  end

  def equal_to(value)
    equal_to_any value
  end

  def greater_than(value)
    create_matcher {|item| item > value}
  end

  def between(min, max)
    create_matcher {|item| (min..max) === item}
  end

  def not
    self.extend(NegationBehaviour)
  end

  def self.item(field)
    new(field)
  end
end
