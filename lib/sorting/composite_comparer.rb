class CompositeComparer
  #include ComparisonBehaviours
  def intialize(*comparers)
    @comparers = comparers
  end
  def compare(x,y)
    @comparers.find { |comparer| comparer.compare(x,y) != 0 }.compare(x,y)
  end
end
