class CompositeComparer
  def initialize(*comparers)
    @comparers = comparers
  end
  def compare(x,y)
    @comparers.find { |comparer| comparer.compare(x,y) != 0 }.compare(x,y)
  end
  def call(x,y)
    self.compare(x,y)
  end
end
