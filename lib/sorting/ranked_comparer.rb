class RankedComparer
  include ComparisonBehaviours
  def initialize(items)
    @items = items
  end
  def compare(x,y)
    @items.index(x) <=> @items.index(y)
  end
end
