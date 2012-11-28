class RankedComparer
  include ComparisonBehaviours
  def initialize(items)
    @items = items
  end
  def compare(x,y)
    @items.index_of(x) <=> @items.index_of(y)
  end
end
