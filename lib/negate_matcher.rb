class NegateMatch
  include Matcher

  def initialize(original)
    @original = original
  end

  def matches(item)
    !@original.matches(item)
  end
end
