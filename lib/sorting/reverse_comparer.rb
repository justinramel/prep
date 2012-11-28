require 'comparison_behaviours'

class ReverseComparer
  include ComparisonBehaviours

  def initialize(inner)
    @inner = inner
  end

  def compare(x,y);- @inner.compare(x,y);end
end
