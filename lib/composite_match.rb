require 'matcher'
class CompositeMatch
  include Matcher

  def initialize(first,second)
    @first = first
    @second = second
  end

  def matches(item)
    @first.matches(item) || @second.matches(item)
  end
end
